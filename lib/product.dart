// ignore: camel_case_types
class catalogModel {
  static final catModel = catalogModel._internal();
  catalogModel._internal();
  factory catalogModel() => catModel;

  static List<Products> items = [];

  late catalogModel catalog;
  // = [Products(
  //     id : 1,
  //     name: 'IPhone 12',
  //     desc: 'Apple IPhone 12 Generation',
  //     price: 999,
  //     image:'https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro/lifestyle/-1024w2/gsmarena_001.jpg'),

  //get item by ID
  Products getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  //get item by position
  Products getByPosition(int pos) => items[pos];
}

// ignore: camel_case_types
class Products {
  final int id;
  final String name;
  final String desc;
  final num price;
  // ignore: prefer_typing_uninitialized_variables
  final color;
  final String image;
  Products(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      this.color,
      required this.image});
  //factory to choose constructor
  factory Products.fromMap(Map<String, dynamic> map) => Products(
      id: map["id"],
      name: map['name'],
      desc: map['desc'],
      image: map['image'],
      price: map['price'],
      color: map["color"]);
  //incoding method
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
