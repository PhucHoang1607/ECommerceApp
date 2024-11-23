import 'package:e_commerce_app_project/components/little_components.dart';
import 'package:e_commerce_app_project/model/cart_product.dart';
import 'package:e_commerce_app_project/page/cart/checkoutCod.dart';
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
  int? getTotalPrice;

  late int quantity;

  Future<void> getUserCartItems() async {
    final itemList = await getUserCart();
    final totalprice = await getTotalCartPrice();
    print(totalprice);
    setState(() {
      cartProductList = itemList;
      getTotalPrice = totalprice;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCartItems();
  }

  _openOverlayPaymentMethod() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (page) => LayoutBuilder(builder: (ctx, constraints) {
              var screenWidth = MediaQuery.of(context).size.width;
              var screenHeight = MediaQuery.of(context).size.height;
              return Container(
                width: double.infinity,
                height: screenHeight * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Choose your payment method',
                      style: GoogleFonts.roboto(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: buttonCustome,
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (page) => CheckoutCodScreen(
                                    cartProducts: cartProductList))),
                        child: Container(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 10),
                            child: const Text('Cash'))),
                    ElevatedButton(
                        style: buttonCustome,
                        onPressed: () {},
                        child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: const Text('Payment Card')))
                  ],
                ),
              );
            }));
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
              margin: EdgeInsets.all(10),
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

                                void increaseQuantity() async {
                                  final sucess = await modifiedProductQuantity(
                                      newQuantity: item.quantity! + 1,
                                      cartProductId: item.id);
                                  if (sucess) {
                                    setState(() {
                                      item.quantity = item.quantity! + 1;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Failed to increase quantity')),
                                    );
                                  }
                                }

                                void decreaseQuantity() async {
                                  final sucess = await modifiedProductQuantity(
                                      newQuantity: item.quantity! - 1,
                                      cartProductId: item.id);
                                  if (sucess) {
                                    setState(() {
                                      item.quantity = item.quantity! - 1;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Failed to decrease quantity')));
                                  }
                                }

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
                                      Container(
                                        width: screenWidth * 0.35,
                                        child: Column(
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
                                                  fontSize:
                                                      screenWidth * 0.042),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: decreaseQuantity,
                                            icon: Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child:
                                                    const Icon(Icons.remove)),
                                          ),
                                          Text(
                                            item.quantity.toString(),
                                            style: TextStyle(
                                                fontSize: fontSizeNormal,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                            onPressed: increaseQuantity,
                                            icon: Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: isDark !=
                                                          Brightness.dark
                                                      ? Colors.brown
                                                      : const Color.fromARGB(
                                                          255, 255, 106, 51),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
            ),
            cartProductList.isEmpty
                ? const SizedBox.shrink()
                : Positioned(
                    bottom: 0,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.34,
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
                                '${NumberFormat('#,##0', 'vi_VN').format(getTotalPrice)} VND',
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
                                '${NumberFormat('#,##0', 'vi_VN').format(0000)} VND',
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
                                '${NumberFormat('#,##0', 'vi_VN').format(getTotalPrice)} VND',
                                style: GoogleFonts.roboto(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: _openOverlayPaymentMethod,
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    isDark != Brightness.dark
                                        ? Colors.brown
                                        : const Color.fromARGB(
                                            255, 255, 106, 51))),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 20, right: 20),
                              child: Text(
                                'Proceed to Checkout',
                                style: GoogleFonts.roboto(
                                    fontSize: fontSizeMedium,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
