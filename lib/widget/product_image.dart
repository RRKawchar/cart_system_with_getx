import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart_system_with_getx/model/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductImage extends StatelessWidget{
  ProductModel? productModel;
  ProductImage({super.key, this.productModel});

  @override
  Widget build(BuildContext context) {
   return CachedNetworkImage(
       imageUrl: productModel!.imageUrl.toString(),
     fit: BoxFit.cover,
     errorWidget: (context,url,error)=>const Icon(Icons.image),
     progressIndicatorBuilder: (context,url,downloadProgress)=>const Padding(
         padding: EdgeInsets.all(16),
       child: Center(
         child: CircularProgressIndicator(),
       ),
     ),
   );
  }

}