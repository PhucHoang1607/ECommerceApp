import 'package:flutter/material.dart';

class WishListMainScreen extends StatefulWidget {
  const WishListMainScreen({super.key});

  @override
  State<WishListMainScreen> createState() => _WishListMainScreenState();
}

class _WishListMainScreenState extends State<WishListMainScreen> {
  final List<Map<String, dynamic>> wishListItems = [
    {
      "title": "Product 1",
      "price": "20.00",
      "image": "asset/image/HomeImage1.jpg"
    },
    {
      "title": "Product 2",
      "price": "35.00",
      "image": "asset/image/HomeImage1.jpg"
    },
    {
      "title": "Product 3",
      "price": "15.00",
      "image": "asset/image/HomeImage2.jpg"
    },
  ];
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
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Center(
              child: Text(
                'WishList',
                style: TextStyle(
                    fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: wishListItems.length,
                  itemBuilder: (context, index) {
                    final item = wishListItems[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: Image.asset(item["image"],
                            width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(item["title"]),
                        subtitle: Text("\$${item["price"]}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () {
                                // Chuyển sản phẩm vào giỏ hàng
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Xóa sản phẩm khỏi danh sách yêu thích
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
