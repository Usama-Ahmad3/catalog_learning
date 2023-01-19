
// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_catalog/product.dart';

class CartModel{
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;
  //catalog fields
 late catalogModel _catalog;
  //Collection of IDs - Store Ids of each item
  final List<int> _itemIds = [];
  //get catalog
  catalogModel get catalog => _catalog;
  set catalog(catalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }
  //Get items In The Cart
List<Products> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
  //Get Total Price
num get totalPrice => items.fold(0,(total , current) => total + current.price);
//add method
void add(Products item){
  _itemIds.add(item.id);
}
//Remove
void remove(Products item){
  _itemIds.remove(item.id);

}
}