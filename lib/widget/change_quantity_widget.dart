import 'package:cart_system_with_getx/model/cart_model.dart';
import 'package:cart_system_with_getx/state/cart_state.dart';
import 'package:cart_system_with_getx/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ChangeQuantityWidget extends StatelessWidget{

  final CartController  controller;

   final int index;

  const ChangeQuantityWidget({super.key, required this.controller,required this.index});
  @override
  Widget build(BuildContext context) {
   return ElegantNumberButton(
       initialValue: controller.cart[index].quantity,
       minValue: 0,
       maxValue: 99,
       color: Colors.white,
       onChanged: (value)async{
            print(value);
        controller.cart[index].quantity=value.toInt();

         saveDatabase(controller.cart);

         controller.cart.refresh();
       },
       decimalPlaces: 0
   );
  }



}
