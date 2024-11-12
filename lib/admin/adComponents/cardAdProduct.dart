import 'package:e_commerce_app_project/admin/adPage/detail/detailProduct.dart';
import 'package:e_commerce_app_project/model/product.dart';
import 'package:e_commerce_app_project/services/admin/productF.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardProductAd extends StatefulWidget {
  const CardProductAd({super.key, required this.product});

  final Product product;

  @override
  State<CardProductAd> createState() => _CardProductAdState();
}

class _CardProductAdState extends State<CardProductAd> {
  Future<void> deleteproductAdF() async {
    try {
      await deleteProduct(widget.product.id);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Delete successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed To delete the product')));
    }
  }

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
                  id: widget.product.id,
                  product: widget.product,
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
              widget.product.image,
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
                    widget.product.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    "${NumberFormat("#,##0", "vi_VN").format(widget.product.price)} VND",
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
                    onPressed: deleteproductAdF,
                    child: Icon(Icons.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
