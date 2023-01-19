import 'package:flutter/material.dart';
import 'package:flutter_catalog/elevated_buton.dart';
import 'package:flutter_catalog/product.dart';

// ignore: camel_case_types
class Detail_page extends StatelessWidget{
  final Products catalog;

  const Detail_page({super.key, required this.catalog,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100
        ),
        child: Row(
              children: [
            Padding(
              padding: const EdgeInsets.only(top: 22,left: 20),
              child: Text('&${catalog.price}',style: const TextStyle(
                fontSize: 25,
                color: Colors.red
              ),),
            ),
                const SizedBox(
                  width: 160,
                ),
                SizedBox(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: AddToCart(catalog:catalog)
                  ),
                ),
          ],
        ),
      ),
      // backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
                children: [
                  Hero(
                     tag: 'first',
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        width: 350,
                          constraints: const BoxConstraints(
                            maxHeight: 350,
                          ),
                        child: Image.network(catalog.image,),
                      ),
                    ),
                  ),
                  Container(
                    // height: 30,
                    transformAlignment: Alignment.topCenter,
                    width: double.infinity,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top:20.0,bottom: 15),
                                   child: Text(catalog.name,style: const TextStyle(fontSize: 45),),
                                 ),
                                 Text(catalog.desc,style: const TextStyle(fontSize: 20),),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
                              ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
                          ,style: TextStyle(fontSize: 14),
                          ),
                        )
                ],
              ),
          ),
  ]
          ),
        ))
    );
  }
}