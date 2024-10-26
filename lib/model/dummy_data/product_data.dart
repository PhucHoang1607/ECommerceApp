import 'package:e_commerce_app_project/model/Category.dart';
import 'package:e_commerce_app_project/model/Product.dart';
import 'package:e_commerce_app_project/model/dummy_data/category_data.dart';

final List<Product> lstProductData = [
  //dress
  Product(
      name: "Blue dress",
      price: 190000,
      category: lstCategory.firstWhere(
          (category) => category.name == "Dress"), // Chọn Category "Dress"
      size: Size.large,
      imageURL:
          "https://images.unsplash.com/photo-1591369822096-ffd140ec948f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      isLike: true,
      style: "Woman",
      description: "A stylish blue dress perfect for formal events."),

  //Pants - 8

  Product(
      name: "Cool jeans",
      price: 250000,
      category: lstCategory.firstWhere((category) => category.name == "Pant"),
      size: Size.large,
      imageURL:
          "https://images.unsplash.com/photo-1624378441864-6eda7eac51cb?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      isLike: false,
      style: "Man",
      description: "Classic black jeans with a slim fit."),

  Product(
      name: "Grey chinos",
      price: 230000,
      category: lstCategory.firstWhere((category) => category.name == "Pant"),
      size: Size.small,
      imageURL:
          "https://images.unsplash.com/photo-1602573991155-21f0143bb45c?q=80&w=1914&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Ds",
      isLike: true,
      style: "Man",
      description: "Comfortable grey chinos for everyday wear."),

  Product(
      name: "Blue denim",
      price: 270000,
      category: lstCategory.firstWhere((category) => category.name == "Pant"),
      size: Size.small,
      imageURL:
          "https://images.unsplash.com/photo-1579920896716-51bfb40ec2a0?q=80&w=1917&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      isLike: true,
      style: "Man",
      description: "Stylish blue denim jeans for a casual look."),

  Product(
    name: "Motocycle Tights",
    price: 0,
    category: lstCategory.firstWhere((category) => category.name == "Pant"),
    size: Size.small,
    imageURL:
        "https://images.pexels.com/photos/28904254/pexels-photo-28904254/free-photo-of-ng-i-di-xe-may-t-o-dang-trong-nha-d-xe-do-th-vao-ban-dem.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    isLike: false,
    style: "Woman",
    description: "",
  ),

  Product(
    name: "Modern Trousers",
    price: 755000,
    category: lstCategory.firstWhere((category) => category.name == "Pant"),
    size: Size.small,
    imageURL:
        "https://images.pexels.com/photos/914668/pexels-photo-914668.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    isLike: false,
    style: "Woman",
    description: "",
  ),

  Product(
    name: "Inker Pants",
    price: 355000,
    category: lstCategory.firstWhere((category) => category.name == "Pant"),
    size: Size.small,
    imageURL:
        "https://images.pexels.com/photos/21207686/pexels-photo-21207686/free-photo-of-nh-ng-co-gai-v-i-h-i-au.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    isLike: false,
    style: "Woman",
    description: "",
  ),
  Product(
    name: "Girzen trousers",
    price: 200000,
    category: lstCategory.firstWhere((category) => category.name == "Pant"),
    size: Size.small,
    imageURL:
        "https://images.pexels.com/photos/28570315/pexels-photo-28570315/free-photo-of-ng-i-ph-n-tr-v-i-may-tinh-b-ng-va-tai-nghe.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    isLike: false,
    style: "Woman",
    description: "",
  ),
  Product(
      name: "Trousers",
      price: 250000,
      category: lstCategory.firstWhere((category) => category.name == "Pant"),
      size: Size.large,
      imageURL:
          "https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJyb3duJTIwdHJvdXNlcnxlbnwwfHwwfHx8MA%3D%3D",
      isLike: false,
      style: "Man",
      description: ""),

  //SUit
  Product(
    name: "Bussiness Suit",
    price: 1450000,
    category: lstCategory.firstWhere((category) => category.name == "Suit"),
    size: Size.small,
    imageURL:
        "https://images.pexels.com/photos/26256163/pexels-photo-26256163/free-photo-of-12008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    isLike: false,
    style: "Woman",
    description: "",
  ),

  Product(
    name: "Vest",
    price: 1670000,
    category: lstCategory.firstWhere((category) => category.name == "Suit"),
    size: Size.small,
    imageURL:
        "https://images.pexels.com/photos/1450114/pexels-photo-1450114.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    isLike: false,
    style: "Man",
    description: "",
  ),

  Product(
    name: "Ovany Suit",
    price: 2770000,
    category: lstCategory.firstWhere((category) => category.name == "Suit"),
    size: Size.small,
    imageURL:
        "https://images.pexels.com/photos/2955375/pexels-photo-2955375.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    isLike: false,
    style: "Man",
    description: "",
  ),

  Product(
    name: "Full Clothes Bussiness",
    price: 2770000,
    category: lstCategory.firstWhere((category) => category.name == "Suit"),
    size: Size.small,
    imageURL:
        "https://images.pexels.com/photos/10040216/pexels-photo-10040216.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    isLike: false,
    style: "Man",
    description: "",
  ),

  //Shirt - 8
  Product(
      name: "",
      price: 0,
      category:
          lstCategory.firstWhere((category) => category.name == "T-Shirt"),
      size: Size.small,
      imageURL: "",
      isLike: false,
      style: "",
      description: ""),
  Product(
      name: "",
      price: 0,
      category:
          lstCategory.firstWhere((category) => category.name == "T-Shirt"),
      size: Size.small,
      imageURL: "",
      isLike: false,
      style: "",
      description: ""),
  Product(
      name: "",
      price: 0,
      category:
          lstCategory.firstWhere((category) => category.name == "T-Shirt"),
      size: Size.small,
      imageURL: "",
      isLike: false,
      style: "",
      description: ""),
  Product(
      name: "",
      price: 0,
      category:
          lstCategory.firstWhere((category) => category.name == "T-Shirt"),
      size: Size.small,
      imageURL: "",
      isLike: false,
      style: "",
      description: ""),
  Product(
      name: "",
      price: 0,
      category:
          lstCategory.firstWhere((category) => category.name == "T-Shirt"),
      size: Size.small,
      imageURL: "",
      isLike: false,
      style: "",
      description: ""),
  Product(
      name: "",
      price: 0,
      category:
          lstCategory.firstWhere((category) => category.name == "T-Shirt"),
      size: Size.small,
      imageURL: "",
      isLike: false,
      style: "",
      description: ""),
  Product(
      name: "",
      price: 0,
      category:
          lstCategory.firstWhere((category) => category.name == "T-Shirt"),
      size: Size.small,
      imageURL: "",
      isLike: false,
      style: "",
      description: ""),
  Product(
      name: "",
      price: 0,
      category:
          lstCategory.firstWhere((category) => category.name == "T-Shirt"),
      size: Size.small,
      imageURL: "",
      isLike: false,
      style: "",
      description: ""),
];

List<Product> get getProductData => lstProductData;
