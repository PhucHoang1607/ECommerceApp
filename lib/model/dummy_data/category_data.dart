import 'package:e_commerce_app_project/model/Category.dart';

final List<Category> lstCategory = [
  Category(name: "T-Shirt", imgUrl: "asset/icon/shirt.png"),
  Category(name: "Pant", imgUrl: "asset/icon/jeans.png"),
  Category(name: "Dress", imgUrl: "asset/icon/dress.png"),
  Category(name: "Jacket", imgUrl: "asset/icon/jacket.png"),
  Category(name: "Suit", imgUrl: "asset/icon/suit.png"),
  Category(name: "Accessory", imgUrl: "asset/icon/sunglasses.png")
];

List<Category> get getListCategory => lstCategory;
