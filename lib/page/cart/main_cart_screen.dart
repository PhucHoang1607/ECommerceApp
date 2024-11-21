import 'package:e_commerce_app_project/model/cart_product.dart';
import 'package:e_commerce_app_project/page/home.dart';
import 'package:e_commerce_app_project/page/main_cover_screen.dart';
import 'package:e_commerce_app_project/services/user/cartF.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MainCartScreen extends StatefulWidget {
  const MainCartScreen({super.key});

  @override
  State<MainCartScreen> createState() => _MainCartScreenState();
}

class _MainCartScreenState extends State<MainCartScreen> {
  List<CartProduct> cartProductList = [];

  Future<void> getUserCartItems() async {
    final itemList = await getUserCart();
    setState(() {
      cartProductList = itemList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCartItems();
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
              padding: const EdgeInsets.only(top: 20),
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'My Cart',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  cartProductList.isEmpty
                      ? Center(
                          child: Container(
                              margin: const EdgeInsets.only(top: 100),
                              child: Text(
                                'No Item in your cart !',
                                style: GoogleFonts.roboto(
                                    fontSize: fontSizeHeader,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )),
                        )
                      : SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            height: screenHeight * 0.5,
                            child: ListView.builder(
                              itemCount: cartProductList.length,
                              itemBuilder: (context, index) {
                                final item = cartProductList[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: screenWidth * 0.27,
                                        height: screenHeight * 0.12,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey),
                                        child: Image.network(item.productImage),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.productName,
                                            style: GoogleFonts.roboto(
                                                fontSize: fontSizeMedium,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            ' Size: ${item.selectedSize}',
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.042,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${NumberFormat('#,##0', 'vi_VN').format(item.productPrice)} VND',
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.042),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                ],
              ),
            ),
            cartProductList.isEmpty
                ? const SizedBox.shrink()
                : Positioned(
                    bottom: 0,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.28,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 250, 199, 140),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          border: Border.all(width: 1, color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: const Offset(0, 3))
                          ]),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Promo Code',
                                  style:
                                      TextStyle(fontSize: screenWidth * 0.04),
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Apply'))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub-Total:',
                                style: GoogleFonts.roboto(
                                    color: isDark != Brightness.dark
                                        ? Color.fromARGB(255, 58, 54, 54)
                                        : Colors.white,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${NumberFormat('#,##0', 'vi_VN').format(475000)} VND',
                                style: GoogleFonts.roboto(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery-Fee:',
                                style: GoogleFonts.roboto(
                                    color: isDark != Brightness.dark
                                        ? Color.fromARGB(255, 58, 54, 54)
                                        : Colors.white,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${NumberFormat('#,##0', 'vi_VN').format(5000)} VND',
                                style: GoogleFonts.roboto(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border.fromBorderSide(
                                      BorderSide(width: 0.2))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Price:',
                                style: GoogleFonts.roboto(
                                    color: isDark != Brightness.dark
                                        ? Color.fromARGB(255, 58, 54, 54)
                                        : Colors.white,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${NumberFormat('#,##0', 'vi_VN').format(485000)} VND',
                                style: GoogleFonts.roboto(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
