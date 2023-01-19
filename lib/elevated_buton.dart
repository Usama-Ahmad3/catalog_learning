import 'package:flutter/material.dart';
import 'package:flutter_catalog/cart-model.dart';
import 'package:flutter_catalog/product.dart';

class AddToCart extends StatefulWidget{
  final Products catalog;

  const AddToCart({super.key, required this.catalog});
  @override
  State<StatefulWidget> createState() => AddToCartState();
}
class AddToCartState extends State<AddToCart>{
  static bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.teal.shade400,
          shape: const StadiumBorder(),
        ),
        onPressed: (){
          final catalog = catalogModel();
          final cart = CartModel();
          cart.catalog = catalog;
          if(isAdded){
            isAdded = false;
            cart.remove(widget.catalog);
          }
          else{
            isAdded = true;
            cart.add(widget.catalog);
          }
          setState(() {});
        }, child: isAdded? const Icon(Icons.done): const Icon(Icons.add_shopping_cart_sharp));
  }
}