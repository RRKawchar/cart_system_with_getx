import 'package:cart_system_with_getx/state/cart_state.dart';
import 'package:flutter/material.dart';

class TotalItemWidget extends StatelessWidget {
   TotalItemWidget({
    Key? key,required this.text,required this.value,required this.isSubTotal, required this.controller,
  }) : super(key: key);

   String text='',value='';
   bool isSubTotal=false;
  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize:isSubTotal ? 20: 16),),
        Text("\$$value",style: TextStyle(fontWeight: FontWeight.bold,fontSize:isSubTotal ? 20: 16))
      ],
    );
  }
}