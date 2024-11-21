import 'package:e_commerce_app_project/model/product.dart';
import 'package:e_commerce_app_project/services/user/cartF.dart';
import 'package:e_commerce_app_project/services/user/wishlistF.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.id, required this.product});

  final String id;
  final Product product;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  String selectedSize = '';
  String selectedColor = '';
  Future<void> addToWishListUser() async {
    await addToWishList(widget.product.id);
  }

  Future<void> addTocartUser() async {
    await addToCart(
        productId: widget.product.id,
        quantity: 1,
        selectedSize: selectedSize,
        selectedColor: selectedColor);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addTocartUser();
    addToWishListUser();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeMedium = screenWidth * 0.05;
    var fontSizeNormal = screenWidth * 0.04;

    var isDark = MediaQuery.of(context).platformBrightness;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.07),
                    width: double.infinity,
                    color: Color.fromARGB(255, 253, 211, 179),
                    child: Image.network(
                      widget.product.image,
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.4,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " ${widget.product.genderAgecategory.toString().split('.').last}'s Styles ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: fontSizeNormal,
                              color: Colors.grey[700]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.product.name,
                          style: TextStyle(
                              fontSize: fontSizeMedium,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: fontSizeNormal,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(widget.product.description),
                        SizedBox(
                          height: 10,
                          child: Container(
                            margin: const EdgeInsets.only(left: 25, right: 25),
                            decoration: const BoxDecoration(
                                border: Border(
                              bottom: BorderSide(width: 1),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Select Size',
                          style: TextStyle(
                              fontSize: fontSizeMedium,
                              fontWeight: FontWeight.w500),
                        ),
                        if (widget.product.sizes != null)
                          Wrap(
                            spacing: 8,
                            children: widget.product.sizes!.map((size) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Chip(
                                  label: Text(
                                    size,
                                    style: TextStyle(
                                        color: selectedSize == size
                                            ? Colors.grey
                                            : Colors.black),
                                  ),
                                  backgroundColor: selectedSize == size
                                      ? Colors.brown[500]
                                      : Colors.grey[300],
                                ),
                              );
                            }).toList(),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Select Color",
                          style: TextStyle(
                              fontSize: fontSizeMedium,
                              fontWeight: FontWeight.w500),
                        ),
                        if (widget.product.color != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.product.color!.map((hexColor) {
                              Color color = Color(int.parse(
                                  hexColor.replaceFirst('#', '0xFF')));
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedColor = hexColor;
                                  });
                                },
                                child: Container(
                                  width: screenWidth * 0.07,
                                  height: screenHeight * 0.07,
                                  margin: EdgeInsets.only(
                                      right: screenWidth * 0.05),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: selectedColor == hexColor
                                            ? Colors.blue
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                      color: color,
                                      shape: BoxShape.circle),
                                ),
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_back),
                ),
                // Đổi màu nếu like
              ),
              Text(
                "Detail",
                style: GoogleFonts.roboto(
                    fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => addToWishListUser(),
                icon: Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: const Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.red,
                  ),
                ),
                // Đổi màu nếu like
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.12,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${NumberFormat("#,##0", "vi_VN").format(widget.product.price)} VND",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fontSizeMedium, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      onPressed: addTocartUser,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: screenWidth * 0.35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(FontAwesomeIcons.bagShopping),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add to Cart",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: screenWidth * 0.045),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
