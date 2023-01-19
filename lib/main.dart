import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/card_page.dart';
import 'package:flutter_catalog/drawer.dart';
import 'package:flutter_catalog/product.dart';
import 'package:flutter_catalog/product_Widget.dart';
import 'dart:convert';

import 'package:flutter_catalog/splash_screen.dart';

void main(){
  runApp(const catalog());
}
// ignore: camel_case_types
class catalog extends StatelessWidget{
  const catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       brightness:Brightness.dark,
        // fontFamily: 'Crimson',
        primarySwatch: Colors.blueGrey,
      ),
      home: Splash(),
    );
  }
}
class Main extends StatefulWidget{
  const Main({super.key});

  @override
  State<StatefulWidget> createState() => MainState();
}
class MainState extends State<Main>{
  static bool right = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    var catalogjson = await rootBundle.loadString("assets/files/jsonnn");
    var decodedData = jsonDecode(catalogjson);
    var productsData = decodedData["products"];
    catalogModel.items = List.from(productsData).map<Products>((product) => Products.fromMap(product)).toList();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         right = true;
            Navigator.push(context, MaterialPageRoute(builder: (context) => const cart_page(),));
       },child:Icon(Icons.add_shopping_cart,color: Colors.orangeAccent.shade100,)
     ),
     appBar: AppBar(
       toolbarHeight: 100,
       title: const ListTile(title: Text('Catalog App',style: TextStyle(fontSize: 25,color: Colors.blueAccent),),
           subtitle: Text('Trending Products',style: TextStyle(color: Colors.blueAccent),),
       ),
       centerTitle: true,
     ),
     drawer: const drawer(),
       body:(catalogModel.items.isNotEmpty) ? ListView.builder(itemBuilder: (context, index) {
         return ItemWidget(
            catalog: catalogModel.items[index],
         );
       },
       itemCount: catalogModel.items.length,
        ) :  const Center(
         child: CircularProgressIndicator(),
       )
   );
  }
}