import 'package:e_commerce_app_project/components/CardProduct.dart';
import 'package:e_commerce_app_project/model/category.dart';
import 'package:e_commerce_app_project/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_project/model/dummy_data/category_data.dart';
import 'package:e_commerce_app_project/model/dummy_data/product_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;

    var isDark = MediaQuery.of(context).platformBrightness;

    final List<Category> categories = getListCategory;
    final List<Product> products = getProductData;
    return SafeArea(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
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
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: screenHeight * 0.65,
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
            ),
          )
        ],
      ),
    ));
  }
}
