import 'package:e_commerce_app_project/model/product.dart';
import 'package:flutter/material.dart';

class CardProductAd extends StatelessWidget {
  const CardProductAd({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 184, 144, 249)),
        child: Row(
          children: [
            Image.network(
              product.image,
              width: 80,
              height: 80,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(product.name), Text(product.price.toString())],
            )
          ],
        ),
      ),
    );
  }
}
