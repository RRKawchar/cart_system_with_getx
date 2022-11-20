import 'package:cart_system_with_getx/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var cart=List<CartModel>.empty(growable: true).obs;


  sumCart(){

    return cart.map((e) => double.parse(e.price.toString())).reduce((previousValue, element) => previousValue+element);
  }
  shippingFree(){
    return sumCart()*0.1;
  }
}