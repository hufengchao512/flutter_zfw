import './request.dart';
import './beans/category.dart';

export './beans/category.dart';

class CategoryAPI {
  // 分类详情
  static Future<CategoryInfoResp> info(String categoryName, int page,
      [int pagesize = 20]) async {
    var data = await HttpUtils.request("/micro/category/info",
        method: HttpUtils.GET,
        queryParameters: {
          "categoryName": categoryName,
          "page": page,
          "pageSize": pagesize,
        });
    var ret = new CategoryInfoResp.fromJson(data);
    if (ret.code == 0) {
      return ret;
    }
    return ret;
  }

  // 分类详情
  static Future<List<CategoryListBean>> list() async {
    var data =
        await HttpUtils.request("/micro/category/list", method: HttpUtils.GET);
    var ret = new CategoryListResp.fromJson(data);
    if (ret.code == 0) {
      return ret.data;
    }
    return ret.data;
  }
}
