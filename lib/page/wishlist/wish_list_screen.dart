import 'package:e_commerce_app_project/model/user.dart';
import 'package:e_commerce_app_project/model/wish_list_item.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:e_commerce_app_project/services/user/wishlistF.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Center(
              child: Text(
                'Wish List',
                style: TextStyle(
                    fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: wishList.length,
                  itemBuilder: (context, index) {
                    final item = wishList[index];

                    return Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      item.productName,
                                      style: GoogleFonts.roboto(
                                          fontSize: fontSizeNormal,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      item.productPrice.toString(),
                                    )
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.delete))
                              ],
                            ),
                          ]),
                        ),
                        Positioned(
                            top: 8,
                            right: 10,
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
                    childAspectRatio: 0.75,
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     child: FutureBuilder<List<WishListItems>>(
            //         future: getUserWishList(),
            //         builder: (context, snapshot) {
            //           if (snapshot.connectionState == ConnectionState.waiting) {
            //             return const Center(child: CircularProgressIndicator());
            //           } else if (snapshot.hasError) {
            //             return Center(child: Text('Error: ${snapshot.error}'));
            //           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //             return const Center(
            //                 child: Text('No items in wishlist'));
            //           } else {
            //             List<dynamic> wishList = snapshot.data!;
            //             print(wishList);
            //             print(
            //                 wishList.map((item) => item.productName).toList());
            //             return ListView.builder(
            //                 itemCount: wishList.length,
            //                 itemBuilder: (context, index) {
            //                   final item = wishList[index];
            //                   return ListTile(
            //                     contentPadding: EdgeInsets.all(8),
            //                     leading: Container(
            //                         width: 60,
            //                         height: 60,
            //                         child: Image.network(item.productImage)),
            //                     title: Text(item.productName),
            //                     subtitle: Text('\$${item.productPrice}'),
            //                   );
            //                 });
            //           }
            //         }),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
