import 'package:e_commerce_app_project/admin/adPage/detail/detailProduct.dart';
import 'package:e_commerce_app_project/model/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardProductAd extends StatelessWidget {
  const CardProductAd({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.05;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (page) => DetailProductAdP(
                  id: product.id,
                  product: product,
                )));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 184, 144, 249),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Image.network(
              product.image,
              width: screenWidth * 0.2,
              height: screenHeight * 0.09,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: screenWidth * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    "${NumberFormat("#,##0", "vi_VN").format(product.price)} VND",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  )
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(onPressed: () {}, child: Icon(Icons.edit)),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    child: Icon(Icons.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
