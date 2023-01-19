import 'package:flutter/material.dart';
import 'package:flutter_catalog/detail.dart';
import 'package:flutter_catalog/elevated_buton.dart';
import 'package:flutter_catalog/product.dart';

class ItemWidget extends StatefulWidget {
  final Products catalog;

  const ItemWidget({super.key, required this.catalog});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail_page(
                      catalog: widget.catalog,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Card(
          borderOnForeground: true,
          elevation: 0.8,
          margin: const EdgeInsets.all(10.0),
          shadowColor: Colors.orangeAccent.shade200,
          child: ListTile(
            contentPadding: const EdgeInsets.all(7),
            horizontalTitleGap: 20,
            leading: Container(
                color: Colors.grey.shade300,
                width: 50,
                child: Hero(
                  tag: 'first',
                  child: Image.network(
                    widget.catalog.image,
                  ),
                )),
            title: Text(widget.catalog.name,
                style: const TextStyle(fontSize: 18)),
            subtitle: Text(widget.catalog.desc,
                style: const TextStyle(fontSize: 10)),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$${widget.catalog.price}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 30,
                    child: AddToCart(catalog: widget.catalog),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
