import 'package:cart_system_with_getx/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cart = List<CartModel>.empty(growable: true).obs;

  sumCart() {
    return cart.length==0?0: cart
        .map((e) => double.parse(e.price.toString())*e.quantity)
        .reduce((previousValue, element) => previousValue + element);
  }

  getQuantity() {

    return cart.length==0?0: cart
        .map((e) => e.quantity)
        .reduce((previousValue, element) => previousValue + element);
  }

  shippingFree() {
    return sumCart() * 0.1;
  }
}
