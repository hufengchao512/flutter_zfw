import 'package:dio/dio.dart';
import 'package:zfw/components/component.dart';
import 'package:zfw/components/store.dart';
import 'dart:async';
import 'dart:convert';
import './beans/login.dart';

const _tokenKey = "token";
String _token = "";

// 检测登入
bool isLogin() {
  return _token != "";
}

Future<LoginResp> login(String username, String password) async {
  var data = await HttpUtils.request("/bdadmin/user/login",
      method: HttpUtils.POST,
      data: "{\"username\":\"${username}\",\"password\":\"${password}\"}");
  LoginResp res = new LoginResp.fromJson(data);
  if (res.code == 0 && res.data != null) {
    setToken(res.data.token);
  }
  return res;
}

// 设置登入token
void setToken(String token) {
  _token = token;
  Store.setValue(_tokenKey, token);
}

/*
 * 封装 restful 请求
 * 
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class HttpUtils {
  /// global dio object
  static Dio dio;

  /// default options
  static const String API_PREFIX = 'http://fsbd.test.zhifangw.cn/v1';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// request method
  static Future<Map> request(String url,
      {data, method, Map<String, dynamic> queryParameters}) async {
    data = data ?? {};
    queryParameters = queryParameters ?? {};
    method = method ?? 'GET';

    Map<String, dynamic> headMap = {
      "token": _token,
    };
    if (isDebug) {
      /// 打印请求相关信息：请求地址、请求方式、请求参数
      print('请求地址：【' + method + '  ' + url + '】');
      print('header ：${headMap.toString()}');
      print('data ：${data.toString()}');
    }
    Dio dio = createInstance();
    var result;
    try {
      Response response = await dio.request(url,
          data: data,
          queryParameters: queryParameters,
          options: new Options(method: method, headers: headMap));
      result = json.decode(response.data.toString());
      if (isDebug) {
        /// 打印响应相关信息
        print('响应数据：' + response.toString());
      }
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      print('请求出错：' + e.toString());
    }
    return result;
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = new BaseOptions(
        baseUrl: API_PREFIX,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );
      dio = new Dio(options);
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
