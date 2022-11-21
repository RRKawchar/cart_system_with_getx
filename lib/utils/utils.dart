import 'dart:convert';

import 'package:cart_system_with_getx/model/cart_model.dart';
import 'package:cart_system_with_getx/model/product_model.dart';
import 'package:cart_system_with_getx/widget/product_info.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<List<ProductModel>> readJsonDatabase()async{
  final rawData= await rootBundle.loadString("assets/data/my_product_json.json");
  final list=json.decode(rawData) as List<dynamic>;
  return list.map((e) => ProductModel.fromJson(e)).toList();

}

bool isExistsInCart(RxList<CartModel> cart, CartModel cartItem) {

  return cart.length==0? false:cart.any((e) => e.id==cartItem.id)?false:true;
}

void saveDatabase(RxList<CartModel> cart) {

  var box=GetStorage();
  box.write(MY_CART_KEY, jsonEncode(cart));
}

void deleteCart(){

  var box=GetStorage();
  box.remove(MY_CART_KEY);
}
