import 'package:e_commerce_app_project/model/category.dart';
import 'package:flutter/material.dart';

class CardCategoryAd extends StatelessWidget {
  const CardCategoryAd({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            category.image,
            width: 60,
            height: 60,
            errorBuilder: (context, index, trackError) =>
                const Icon(Icons.category),
          ),
          Text(
            category.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
