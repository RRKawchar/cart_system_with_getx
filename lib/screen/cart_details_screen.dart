import 'package:cart_system_with_getx/state/cart_state.dart';
import 'package:cart_system_with_getx/widget/cart_item_info.dart';
import 'package:cart_system_with_getx/widget/product_image.dart';
import 'package:cart_system_with_getx/widget/total_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class CartDetailsScreen extends StatelessWidget {
  final box = GetStorage();
  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Obx(() => Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: controller.cart.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            // dismissible: DismissiblePane(onDismissed: () {}),
                            extentRatio: 0.25,
                            children: [
                              SlidableAction(
                                onPressed: onDo,
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
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
                                      child:CartItemInfo(cartModel: controller.cart[index],))
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

  void onDo(BuildContext context) {}
}





