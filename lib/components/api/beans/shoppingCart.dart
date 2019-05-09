import 'package:zfw/components/api/beans/page.dart';

class SignleBuyShoppingCartResp {
  String errmsg;
  String err;
  int code;
  PageObj page;
  SignleBuyShoppingCart data;

  SignleBuyShoppingCartResp(
      {this.errmsg, this.err, this.code, this.page, this.data});

  SignleBuyShoppingCartResp.fromJson(Map<String, dynamic> json) {
    this.errmsg = json['errmsg'];
    this.err = json['err'];
    this.code = json['code'];
    this.page = json['page'] != null ? PageObj.fromJson(json['page']) : null;
    this.data = json['data'] != null
        ? SignleBuyShoppingCart.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errmsg'] = this.errmsg;
    data['err'] = this.err;
    data['code'] = this.code;
    if (this.page != null) {
      data['page'] = this.page.toString();
    }
    data['data'] = this.data != null ? this.data.toJson() : null;
    return data;
  }
}

class SignleBuyShoppingCart {
  double money;
  List<ShoppingCartShop> shops;

  SignleBuyShoppingCart({this.money, this.shops});

  SignleBuyShoppingCart.fromJson(Map<String, dynamic> json) {
    this.money = json['Money'];
    this.shops = (json['Shops'] as List) != null
        ? (json['Shops'] as List)
            .map((i) => ShoppingCartShop.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Money'] = this.money;
    data['Shops'] =
        this.shops != null ? this.shops.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class ShoppingCartShop {
  String shopCode;
  String shopName;
  List<ShoppingCartProduct> items;

  ShoppingCartShop({this.shopCode, this.shopName, this.items});

  ShoppingCartShop.fromJson(Map<String, dynamic> json) {
    this.shopCode = json['ShopCode'];
    this.shopName = json['ShopName'];
    this.items = (json['Items'] as List) != null
        ? (json['Items'] as List)
            .map((i) => ShoppingCartProduct.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ShopCode'] = this.shopCode;
    data['ShopName'] = this.shopName;
    data['Items'] =
        this.items != null ? this.items.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class ShoppingCartProduct {
  String activityCode;
  String productImage;
  String productName;
  String productNo;
  String skuID;
  String spacValue;
  int num;
  double price;
  int stock;
  List<ShoppingCartProduct> gift;

  ShoppingCartProduct(
      {this.activityCode,
      this.productImage,
      this.productName,
      this.productNo,
      this.skuID,
      this.spacValue,
      this.num,
      this.price,
      this.stock,
      this.gift});

  ShoppingCartProduct.fromJson(Map<String, dynamic> json) {
    this.activityCode = json['ActivityCode'];
    this.productImage = json['ProductImage'];
    this.productName = json['ProductName'];
    this.productNo = json['ProductNo'];
    this.skuID = json['SkuID'];
    this.spacValue = json['SpacValue'];
    this.num = json['Num'];
    this.price = json['Price'];
    this.stock = json['Stock'];
    this.gift = (json['Gift'] as List) != null
        ? (json['Gift'] as List)
            .map((i) => ShoppingCartProduct.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ActivityCode'] = this.activityCode;
    data['ProductImage'] = this.productImage;
    data['ProductName'] = this.productName;
    data['ProductNo'] = this.productNo;
    data['SkuID'] = this.skuID;
    data['SpacValue'] = this.spacValue;
    data['Num'] = this.num;
    data['Price'] = this.price;
    data['Stock'] = this.stock;
    data['Gift'] =
        this.gift != null ? this.gift.map((i) => i.toJson()).toList() : null;
    return data;
  }
}