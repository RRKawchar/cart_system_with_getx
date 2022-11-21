// ignore_for_file: list_remove_unrelated_type

import 'package:cart_system_with_getx/state/cart_state.dart';
import 'package:cart_system_with_getx/utils/utils.dart';
import 'package:cart_system_with_getx/widget/cart_item_info.dart';
import 'package:cart_system_with_getx/widget/change_quantity_widget.dart';
import 'package:cart_system_with_getx/widget/product_image.dart';
import 'package:cart_system_with_getx/widget/total_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class CartDetailsScreen extends StatelessWidget {
  CartDetailsScreen({super.key});
  final box = GetStorage();
  CartController controller = Get.find();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),

        actions: [
          InkWell(
            child: Icon(Icons.clear),
            onTap: () {
              controller.cart.clear();
              deleteCart();
            },
          )
        ],
      ),
      body: Obx(() => Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: controller.cart.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            extentRatio: 0.25,
                            children: [
                              SlidableAction(
                                label: 'Delete',
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                onPressed: (context) {
                                  controller.cart.removeAt(index);
                                  saveDatabase(controller.cart);
                                },
                              ),
                            ],
                          ),
                          child: Card(
                            elevation: 8.0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: ProductImage(
                                        productModel: controller.cart[index],
                                      )),
                                  Expanded(
                                      flex: 6,
                                      child:CartItemInfo(cartModel: controller.cart[index],)),

                                  Center(
                                    child: ChangeQuantityWidget(
                                      controller: controller,
                                      index: index,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })),

              TotalWidget(controller: controller,)

            ],
          )),
    );
  }


}






