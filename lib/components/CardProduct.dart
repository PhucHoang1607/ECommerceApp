import 'package:e_commerce_app_project/model/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.id,
    required this.product,
    required this.size, // Thay đổi thành một tham số duy nhất cho kích thước
    required this.islike,
    this.haveImage,
  });

  final double
      size; // Sử dụng một giá trị duy nhất cho cả chiều rộng và chiều cao
  final String? id;
  final Product product;
  final bool islike;
  final bool? haveImage;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // Không sử dụng Card, bỏ nền và shadow
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.brown.withOpacity(0.3)),
      child: InkWell(
        splashColor: Colors.grey.withAlpha(30),
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.center, // Căn trái
          children: [
            Stack(
              children: [
                Container(
                  width: size,
                  height:
                      size, // Đảm bảo chiều rộng và chiều cao bằng nhau để tạo hình vuông
                  child: //product.image != null
                      // ? const Icon(Icons.image)
                      // :
                      Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          shape: BoxShape.circle),
                      child: Icon(
                        islike
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        color: islike
                            ? Colors.red
                            : Colors.black, // Đổi màu nếu like
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
                children: [
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    NumberFormat('#,##0', 'vi_VN').format(product.price) +
                        ' VND',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
