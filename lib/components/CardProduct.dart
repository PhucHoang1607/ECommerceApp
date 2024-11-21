import 'package:e_commerce_app_project/components/DetailProduct.dart';
import 'package:e_commerce_app_project/model/product.dart';
import 'package:e_commerce_app_project/services/user/wishlistF.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CardProduct extends StatefulWidget {
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
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  Future<void> addToWishListUser() async {
    await addToWishList(widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          // Không sử dụng Card, bỏ nền và shadow
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.brown.withOpacity(0.3)),
          child: InkWell(
            splashColor: Colors.grey.withAlpha(30),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (page) => DetailProduct(
                      id: widget.product.id, product: widget.product)));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.center, // Căn trái
              children: [
                Stack(
                  children: [
                    Container(
                      width: widget.size,
                      height: widget
                          .size, // Đảm bảo chiều rộng và chiều cao bằng nhau để tạo hình vuông
                      child: //product.image != null
                          // ? const Icon(Icons.image)
                          // :
                          Image.network(
                        widget.product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () => addToWishListUser(),
                        icon: Container(
                          width: screenWidth * 0.1,
                          height: screenWidth * 0.1,
                          decoration: BoxDecoration(
                              color: Colors.grey[200], shape: BoxShape.circle),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.red,
                          ),
                        ),
                        // Đổi màu nếu like
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
                        widget.product.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${NumberFormat('#,##0', 'vi_VN').format(widget.product.price)} VND',
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
        ),
      ],
    );
  }
}
