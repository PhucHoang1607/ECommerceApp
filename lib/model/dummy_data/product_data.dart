import 'package:e_commerce_app_project/model/category.dart';
import 'package:e_commerce_app_project/model/Product.dart';
import 'package:e_commerce_app_project/model/dummy_data/category_data.dart';

final List<Product> lstProductData = [
  //dress
  Product(
      name: "Blue dress",
      price: 190000,
      category: 'Dress', // Chọn Category "Dress"
      sizes: ['large'],
      image:
          "https://images.unsplash.com/photo-1591369822096-ffd140ec948f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      genderAgecategory: GenderAgeCategory.women,
      description: "A stylish blue dress perfect for formal events.",
      id: '',
      dateAdded: DateTime(4, 10, 2024),
      countInStock: 40),

  //Pants - 8

  Product(
      name: "Cool jeans",
      price: 250000,
      category: 'Pant',
      sizes: ['Small'],
      image:
          "https://images.unsplash.com/photo-1624378441864-6eda7eac51cb?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      id: '',
      dateAdded: DateTime(4, 10, 2024),
      countInStock: 40,
      description: "Classic black jeans with a slim fit."),

  Product(
      name: "Grey chinos",
      price: 230000,
      id: '',
      dateAdded: DateTime(4, 10, 2024),
      countInStock: 40,
      category: 'Pant',
      sizes: ['small'],
      image:
          "https://images.unsplash.com/photo-1602573991155-21f0143bb45c?q=80&w=1914&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Ds",
      genderAgecategory: GenderAgeCategory.men,
      description: "Comfortable grey chinos for everyday wear."),

  Product(
      id: '',
      dateAdded: DateTime(4, 10, 2024),
      countInStock: 40,
      name: "Blue denim",
      price: 270000,
      category: 'pant',
      sizes: ['small'],
      image:
          "https://images.unsplash.com/photo-1579920896716-51bfb40ec2a0?q=80&w=1917&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      genderAgecategory: GenderAgeCategory.men,
      description: "Stylish blue denim jeans for a casual look."),

  Product(
    name: " Clothes Bussiness",
    price: 2770000,
    category: 'suit',
    sizes: ['small'],
    image:
        "https://images.pexels.com/photos/10040216/pexels-photo-10040216.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    genderAgecategory: GenderAgeCategory.men,
    description: "",
    id: '',
    dateAdded: DateTime(4, 10, 2024),
    countInStock: 40,
  ),

  //Shirt - 8
];

List<Product> get getProductData => lstProductData;
