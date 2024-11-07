import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_project/components/CardProduct.dart';
import 'package:e_commerce_app_project/model/category.dart';
import 'package:e_commerce_app_project/model/Product.dart';
import 'package:e_commerce_app_project/model/dummy_data/category_data.dart';
import 'package:e_commerce_app_project/model/dummy_data/product_data.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> lstImagecarousel = [
    'asset/image/carosel1.jpg',
    'asset/image/carosel2.jpg',
    'asset/image/carosel3.jpg',
    'asset/image/carosel4.jpg',
  ];

  int? _curentIndexImage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;

    var isDark = MediaQuery.of(context).platformBrightness;

    final List<Category> categories = getListCategory;
    final List<Product> products = getProductData;

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    const Text(
                      'Welcome!',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Hoang Phuc",
                      style: TextStyle(
                        fontSize: fontSizeNormal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.grey.withOpacity(0.5)),
                    shape: MaterialStateProperty.all<CircleBorder>(
                      const CircleBorder(),
                    ),
                  ),
                  color: isDark != Brightness.dark
                      ? Colors.brown
                      : const Color.fromARGB(255, 255, 106, 51),
                  icon: const Icon(FontAwesomeIcons.bell),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 20),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(screenWidth * 0.3)),
                      border: Border.all(
                          width: 1,
                          color: isDark != Brightness.dark
                              ? Colors.brown.withOpacity(0.5)
                              : const Color.fromARGB(255, 255, 106, 51)
                                  .withOpacity(0.5))),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: isDark != Brightness.dark
                            ? Colors.brown
                            : const Color.fromARGB(255, 255, 106, 51),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: "Search ...",
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(10),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    isDark != Brightness.dark
                        ? Colors.brown
                        : const Color.fromARGB(255, 255, 106, 51),
                  ),
                  shape: MaterialStateProperty.all<CircleBorder>(
                    CircleBorder(),
                  ),
                ),
                icon: const Icon(
                  Icons.filter_list_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: CarouselSlider.builder(
              itemCount: lstImagecarousel.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      lstImagecarousel[index],
                      fit: BoxFit.cover,
                      width: screenWidth * 0.7,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                  height: screenHeight * 0.16, // Chiều cao của carousel
                  enlargeCenterPage: true, // Phóng to hình ảnh ở giữa
                  autoPlay: true, // Tự động chuyển ảnh
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal, // Cuộn theo chiều ngang
                  onPageChanged: (index, reason) {
                    setState(() {
                      _curentIndexImage = index;
                      print(_curentIndexImage);
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: screenWidth * 0.25,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(lstImagecarousel.length, (index) {
                  return AnimatedContainer(
                    duration:
                        const Duration(seconds: 1), // Hiệu ứng chuyển đổi màu
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _curentIndexImage == index
                        ? 14
                        : 12, // Tăng kích thước nếu là ảnh hiện tại
                    height: _curentIndexImage == index ? 14 : 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _curentIndexImage == index
                          ? isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51)
                          : Colors.grey.withOpacity(0.5),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                    fontSize: screenWidth * 0.06, fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            height: screenHeight * 0.12,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: screenWidth * 0.2,
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          decoration: BoxDecoration(
                              color: Colors.brown.withOpacity(0.4),
                              shape: BoxShape.circle),
                          child: Image.asset(
                            category.image,
                            width: screenWidth * 0.1,
                            height: screenHeight * 0.03,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          category.name,
                          style: TextStyle(
                              fontSize: fontSizeNormal,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            "News",
            style: TextStyle(
              fontSize: fontSizeNormal,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: screenHeight * 0.37,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return CardProduct(
                          id: product.id,
                          product: product,
                          size: screenWidth * 0.3,
                          islike: false);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
