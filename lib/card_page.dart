import 'package:flutter/material.dart';
import 'package:flutter_catalog/cart-model.dart';

// ignore: camel_case_types
class cart_page extends StatelessWidget{
  const cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          Expanded(
              child:Padding(
                padding: EdgeInsets.all(32.0),
                child: CartList(),
              )
          ),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}
class CartTotal extends StatefulWidget{
  const CartTotal({super.key});

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$${_cart.totalPrice}',style: const TextStyle(fontSize: 30),),
          ),
          const SizedBox(
            width: 170,
          ),
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: Colors.teal.shade400,content: const Text('Buying Not Supported Yet')));
          setState(() {
          });
            },
              child: const Text('Buy',style: TextStyle(fontSize: 25,),))
        ],
      ),
    );
  }
}
class CartList extends StatefulWidget{
  const CartList({super.key});

  @override
  State<StatefulWidget> createState() => CartListState();
}
class CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final cart = CartModel();
    return cart.items.isEmpty?const Center(child: Text("Nothing To Show",style: TextStyle(fontSize:40),)):ListView.builder(
        itemCount: cart.items.length,itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon :const Icon(Icons.remove_done_outlined), onPressed: () {
              cart.remove(cart.items[index]);
              cart.totalPrice.toString();
              setState(() {
              });
          },),
          // ignore: unnecessary_string_interpolations
          title: Text('${cart.items[index].name}'),
        ) );
  }

}