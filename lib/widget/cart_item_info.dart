import 'package:cart_system_with_getx/model/cart_model.dart';
import 'package:flutter/material.dart';

class CartItemInfo extends StatelessWidget {
  const CartItemInfo({Key? key, required this.cartModel}) : super(key: key);


  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8, right: 8),
            child: Text(
              cartModel.name
                  .toString(),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight:
                  FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.monetization_on,color: Colors.grey,size: 16,),
                  const SizedBox(width: 4,),
                  Text(
                    cartModel.price
                        .toString(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight:
                        FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}