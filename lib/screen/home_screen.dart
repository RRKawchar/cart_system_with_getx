import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:cart_system_with_getx/model/cart_model.dart';
import 'package:cart_system_with_getx/model/product_model.dart';
import 'package:cart_system_with_getx/screen/cart_details_screen.dart';
import 'package:cart_system_with_getx/state/cart_state.dart';
import 'package:cart_system_with_getx/utils/utils.dart';
import 'package:cart_system_with_getx/widget/product_card.dart';
import 'package:cart_system_with_getx/widget/product_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(CartController());

  final box=GetStorage();


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)async {
     String cartSave=await box.read(MY_CART_KEY);
     if(cartSave.isNotEmpty && cartSave.isNotEmpty){
       final listCart=jsonDecode(cartSave) as List<dynamic>;
       final listCartParsed=listCart.map((e) => CartModel.fromJson(e)).toList();
       if(listCartParsed.isNotEmpty) controller.cart.value=listCartParsed;
     }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
          future: readJsonDatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var listProduct = snapshot.data as List<ProductModel>;
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                    itemCount: listProduct.length,
                    itemBuilder: (context, index) {
                      return ProductCard(productModel: listProduct[index]);
                    }),
              );
            }
          }),
      floatingActionButton: Obx(() => Badge(
            position: const BadgePosition(
              top: 0,
              end: 1,
            ),
            animationDuration: const Duration(milliseconds: 200),
            animationType: BadgeAnimationType.scale,
            showBadge: true,
            badgeColor: Colors.red,
            badgeContent: Text(
              controller.cart.length > 9 ? '9+' : '${controller.cart.length}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            child: FloatingActionButton(
              onPressed: () =>Get.to(CartDetailsScreen()),
              child: const Icon(Icons.add_shopping_cart_outlined),
            ),
          )),
    );
  }
}
