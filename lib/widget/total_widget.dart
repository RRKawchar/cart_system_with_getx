import 'package:cart_system_with_getx/state/cart_state.dart';
import 'package:cart_system_with_getx/widget/total_item_widget.dart';
import 'package:flutter/material.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    Key? key, required this.controller,
  }) : super(key: key);

  final CartController controller;

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
              value: controller.sumCart().toString(),
              controller: controller,
              isSubTotal: false,
            )
          ],
        ),
      ),
    );
  }
}

