import 'package:e_commerce_app_project/components/CardProduct.dart';

import 'package:e_commerce_app_project/services/user/categoryF.dart';
import 'package:e_commerce_app_project/services/user/productF.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MainProductScreen extends StatefulWidget {
  const MainProductScreen({super.key});

  @override
  State<MainProductScreen> createState() => _MainProductScreenState();
}

class _MainProductScreenState extends State<MainProductScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  List<dynamic> categories = [];
  List<dynamic> products = [];
  List<dynamic> filteredProducts = []; // New list to show filtered products
  String activeCategoryId = '';

  Future<void> getCategory() async {
    final cateF = await getListCategoryUser();
    setState(() {
      categories = cateF;
    });
  }

  Future<void> getProduct() async {
    final productF = await getProductListUser();
    setState(() {
      products = productF;
      filteredProducts = productF;
    });
  }

  void filterProductByCategory(String categoryId) async {
    try {
      final productList = await fetchProductsByCategory(categoryId);
      setState(() {
        activeCategoryId = categoryId;
        filteredProducts = products
            .where((product) => product.category?.id == categoryId)
            .toList();
      });
    } catch (e) {
      print("Error: $e");
    }
    // setState(() {
    //   activeCategoryId = categoryId;
    //   if (activeCategoryId != '') {
    //     setState(() {
    //       filteredProducts = products
    //           .where((product) => product.category?.id == categoryId)
    //           .toList();
    //     });
    //   } else {
    //     filteredProducts = products;
    //   }
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;

    var isDark = MediaQuery.of(context).platformBrightness;

    return SafeArea(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenWidth * 0.3)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w500),
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
              height: 10,
            ),
            Container(
                height: screenHeight * 0.05,
                child: Row(
                  children: [
                    Container(
                      child: TextButton(
                        onPressed: getProduct,
                        child: Text(
                          "All",
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            //final category = categories[index];
                            return Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll<Color>(
                                              isDark != Brightness.dark
                                                  ? Colors.brown
                                                  : const Color.fromARGB(
                                                      255, 255, 106, 51))),
                                  onPressed: () {
                                    filterProductByCategory(category.id);
                                  },
                                  child: Text(category.name)),
                            );
                          }),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                //padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: screenHeight * 0.8,
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];

                      return CardProduct(
                          id: product.id,
                          product: product,
                          size: screenWidth * 0.3,
                          islike: false);
                    }),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
