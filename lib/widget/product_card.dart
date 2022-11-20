import 'package:cart_system_with_getx/model/product_model.dart';
import 'package:cart_system_with_getx/widget/product_image.dart';
import 'package:cart_system_with_getx/widget/product_info.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {

  ProductModel? productModel;
   ProductCard({Key? key,this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Column(
        children: [
          ProductImage(productModel:productModel),
          ProductInfo(productModel:productModel)
        ],
      ),
    );
  }
}
