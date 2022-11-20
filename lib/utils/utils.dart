import 'dart:convert';

import 'package:cart_system_with_getx/model/cart_model.dart';
import 'package:cart_system_with_getx/model/product_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<List<ProductModel>> readJsonDatabase()async{
  final rawData= await rootBundle.loadString("assets/data/my_product_json.json");
  final list=json.decode(rawData) as List<dynamic>;
  return list.map((e) => ProductModel.fromJson(e)).toList();

}

bool isExistsInCart(RxList<CartModel> cart, CartModel cartItem) {

  return cart.contains(cartItem);
}