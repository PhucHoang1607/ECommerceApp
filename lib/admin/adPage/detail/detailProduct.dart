import 'package:e_commerce_app_project/model/product.dart';
import 'package:flutter/material.dart';

class DetailProductAdP extends StatefulWidget {
  const DetailProductAdP({super.key, required this.id, required this.product});

  final String id;
  final Product product;

  @override
  State<DetailProductAdP> createState() => _DetailProductAdPState();
}

class _DetailProductAdPState extends State<DetailProductAdP> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(),
      ),
    ));
  }
}
