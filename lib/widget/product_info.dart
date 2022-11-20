import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart_system_with_getx/model/cart_model.dart';
import 'package:cart_system_with_getx/model/product_model.dart';
import 'package:cart_system_with_getx/state/cart_state.dart';
import 'package:cart_system_with_getx/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


// ignore: constant_identifier_names
const MY_CART_KEY='cart';

// ignore: must_be_immutable
class ProductInfo extends StatelessWidget{
  ProductModel? productModel;
  ProductInfo({super.key, this.productModel});


  final controller=Get.put(CartController());
  final box=GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
              Text("${productModel!.name}",style: const TextStyle(fontWeight: FontWeight.bold),),

          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text.rich(
                 TextSpan(
                   children: [
                     TextSpan(
                       text: double.parse(productModel!.oldPrice.toString())==0?"":"\$${productModel!.oldPrice}",

                       style:const TextStyle(
                         color: Colors.grey,
                         decoration: TextDecoration.lineThrough
                       )
                     ),
                     TextSpan(text: '\$${productModel!.price}')
                   ]
                 )
               ),
              InkWell(
                onTap: ()async{
                 var cartItem=CartModel(
                     id: productModel!.id,
                     name: productModel!.name,
                     oldPrice: productModel!.oldPrice,
                     price: productModel!.price,
                     imageUrl: productModel!.imageUrl,
                     category: productModel!.category,
                     quantity: 1);

                 if(isExistsInCart(controller.cart,cartItem))
                  {
                    var indexUpdate=controller.cart.indexWhere((e)=>e.id==productModel!.id);
                    var productUpdate=controller.cart.firstWhere((element) => element.id==productModel!.id);
                    productUpdate.quantity +=1;
                    controller.cart.insert(indexUpdate, productUpdate);

                  }else{
                   controller.cart.add(cartItem);
                   var jsonDBEncoded=jsonEncode(controller.cart);
                   await box.write(MY_CART_KEY, jsonDBEncoded);
                 }
                },
                child: const Icon(Icons.add_shopping_cart_outlined),
              )
            ],
          )
        ],
      ),
    );
  }



}