import 'package:e_commerce_app_project/model/category.dart';

final List<Category> lstCategory = [
  Category(name: "T-Shirt", imgUrl: "asset/icon/shirt.png", id: ''),
  Category(name: "Pant", imgUrl: "asset/icon/jeans.png", id: ''),
  Category(name: "Dress", imgUrl: "asset/icon/dress.png", id: ''),
  Category(name: "Jacket", imgUrl: "asset/icon/jacket.png", id: ''),
  Category(name: "Suit", imgUrl: "asset/icon/suit.png", id: ''),
  Category(name: "Accessory", imgUrl: "asset/icon/sunglasses.png", id: '')
];

List<Category> get getListCategory => lstCategory;
