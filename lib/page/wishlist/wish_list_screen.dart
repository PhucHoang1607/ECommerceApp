import 'package:e_commerce_app_project/model/user.dart';
import 'package:e_commerce_app_project/model/wish_list_item.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:e_commerce_app_project/services/user/wishlistF.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WishListMainScreen extends StatefulWidget {
  const WishListMainScreen({
    super.key,
  });

  @override
  State<WishListMainScreen> createState() => _WishListMainScreenState();
}

class _WishListMainScreenState extends State<WishListMainScreen> {
  List<WishListItems> wishList = [];

  Future<void> getWishListUser() async {
    final getwishlistF = await getUserWishList();
    setState(() {
      wishList = getwishlistF;
    });
  }

  Future<void> deleteItemWishList(String productId) async {
    await removeFromWishList(productId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Removed from WishList')),
    );
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Failed to remove from WishList')),
    //   );
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWishListUser();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isDark = MediaQuery.of(context).platformBrightness;
    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;
    return Center(
        child: SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Center(
              child: Text(
                'Wish List',
                style: TextStyle(
                    color: isDark != Brightness.dark
                        ? Colors.brown
                        : const Color.fromARGB(255, 255, 106, 51),
                    fontSize: fontSizeHeader,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 183, 116),
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: GridView.builder(
                  itemCount: wishList.length,
                  itemBuilder: (context, index) {
                    final item = wishList[index];

                    return Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Column(children: [
                            Container(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.2,
                              child: Image.network(
                                item.productImage,
                                width: screenWidth * 0.2,
                              ),
                            ),
                            Text(
                              item.productName,
                              style: GoogleFonts.roboto(
                                  fontSize: fontSizeNormal,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${NumberFormat("#,##0", "vi_VN").format(item.productPrice)} VND",
                            ),
                            ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.red)),
                                onPressed: () =>
                                    deleteItemWishList(item.productId),
                                child: Text(
                                  'Remove',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                        ),
                        Positioned(
                            top: 8,
                            right: 5,
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.favorite,
                                  color: isDark != Brightness.dark
                                      ? Colors.brown
                                      : Colors.orange,
                                ))),
                      ],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.67,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
