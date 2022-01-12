import 'dart:ffi';

import 'package:shop_app/models/ProductOrder.dart';
import "package:universal_html/html.dart";
import 'dart:convert';

class SessionStorageHelper {
  static Storage sessionStorage = window.sessionStorage;

  /// To save data in local storage
  static void saveValue(String key, dynamic value) {
    if (key == 'cartList') {
      print('***SessionHelper:saveValue: ' + value.toString());
      List<ProductOrder> productOrders = value;
      print('***SessionHelper:saveValue:productOrders: ' +
          jsonEncode(productOrders));

      sessionStorage[key] = jsonEncode(productOrders);
    } else if (key == 'numOfItems') {
      sessionStorage[key] = value.toString();
    }
  }

  /// To get data from local storage
  static dynamic getValue(String key) async {
    if (key == 'numOfItems') {
      print('***SessionHelper:getValue:numOfItems: ' + sessionStorage[key]);
      if (sessionStorage[key] != null) {
        return int.parse(sessionStorage[key]);
      }
      return null;
    }
  }

  /// To get data from local storage
  static int getProductCount() {
    print('***SessionHelper:getProductCount:numOfItems: ' +
        sessionStorage['numOfItems']);
    if (sessionStorage['numOfItems'] != null) {
      return int.parse(sessionStorage['numOfItems']);
    }

    return 0.toInt();
  }

  /// To get the Product Order List
  static List<ProductOrder> getProductOrders(String key) {
    // print(
    //     '***SessionHelper:getProductOrders:decode: ' + json.decode('cartList'));
    if (sessionStorage[key] != null) {
      List listJsonContent = json.decode(sessionStorage[key]);

      return List<ProductOrder>.from(
          listJsonContent.map((i) => ProductOrder.fromJson(i)));
    }
    return [];
  }

  /// To remove data in local storage
  static void removeValue(String key) {
    sessionStorage.remove(key);
  }

  /// To clear all data in local storage
  static void clearsessionStorage() {
    sessionStorage.clear();
  }
}
