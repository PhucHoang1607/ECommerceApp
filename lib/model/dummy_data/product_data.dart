import 'package:e_commerce_app_project/model/Category.dart';
import 'package:e_commerce_app_project/model/Product.dart';
import 'package:e_commerce_app_project/model/dummy_data/category_data.dart';

final List<Product> lstProductData = [
  Product(
      name: "Blue dress",
      price: 190000,
      category: lstCategory.firstWhere(
          (category) => category.name == "Dress"), // Chọn Category "Dress"
      size: Size.large,
      imageURL:
          "https://images.unsplash.com/photo-1591369822096-ffd140ec948f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      isLike: true,
      description: "A stylish blue dress perfect for formal events."),
  Product(
      name: "Black jeans",
      price: 250000,
      category: lstCategory.firstWhere((category) => category.name == "Pant"),
      size: Size.large,
      imageURL:
          "https://images.unsplash.com/photo-1624378441864-6eda7eac51cb?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      isLike: false,
      description: "Classic black jeans with a slim fit."),
  Product(
      name: "Grey chinos",
      price: 230000,
      category: lstCategory.firstWhere((category) => category.name == "Pant"),
      size: Size.small,
      imageURL:
          "https://images.unsplash.com/photo-1602573991155-21f0143bb45c?q=80&w=1914&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Ds",
      isLike: true,
      description: "Comfortable grey chinos for everyday wear."),
  Product(
      name: "Blue denim",
      price: 270000,
      category: lstCategory.firstWhere((category) => category.name == "Pant"),
      size: Size.small,
      imageURL:
          "https://images.unsplash.com/photo-1579920896716-51bfb40ec2a0?q=80&w=1917&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      isLike: true,
      description: "Stylish blue denim jeans for a casual look."),
];

List<Product> get getProductData => lstProductData;
