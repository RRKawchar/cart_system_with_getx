import 'package:cart_system_with_getx/state/cart_state.dart';
import 'package:cart_system_with_getx/widget/total_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalWidget extends StatelessWidget {
   TotalWidget({
    Key? key, required this.controller,
  }) : super(key: key);

  final CartController controller;

  final formatCurrency=NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding:const EdgeInsets.all(16),
        child: Column(
          children: [
            TotalItemWidget(
              text: "Total",
              value:formatCurrency.format(controller.sumCart()),
              controller: controller,
              isSubTotal: false,
            ),
            const Divider(thickness: 1,),
            TotalItemWidget(
              text: "Delivery Charge",
              value: formatCurrency.format(controller.shippingFree()),
              controller: controller,
              isSubTotal: false,
            ),
            const Divider(thickness: 1,),
            TotalItemWidget(
              text: "Sub Total",
              value: formatCurrency.format(controller.shippingFree()+controller.sumCart()),
              controller: controller,
              isSubTotal: false,
            ),
          ],
        ),
      ),
    );
  }
}

