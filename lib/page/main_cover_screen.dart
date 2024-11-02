import 'package:e_commerce_app_project/components/CustomeItemNavigation.dart';
import 'package:e_commerce_app_project/page/cart/main_card_screen.dart';
import 'package:e_commerce_app_project/page/home.dart';
import 'package:e_commerce_app_project/page/product/main_product_screen.dart';
import 'package:e_commerce_app_project/page/review_screen.dart';
import 'package:e_commerce_app_project/page/user/user_screen.dart';
import 'package:e_commerce_app_project/page/wishlist/wish_list_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainCoverScreen extends StatefulWidget {
  const MainCoverScreen({super.key});

  @override
  State<MainCoverScreen> createState() => _MainCoverScreenState();
}

class _MainCoverScreenState extends State<MainCoverScreen> {
  int _selectedIndex = 0;
  bool _isHide = true;

  final List<Widget> _page = [
    HomeScreen(),
    MainProductScreen(),
    WishListMainScreen(),
    MainCartScreen(),
    UserScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _togglenavbarVisibility() {
    setState(() {
      _isHide = !_isHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isDark = MediaQuery.of(context).platformBrightness;
    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            _page[_selectedIndex],
            _isHide == true
                ? Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: Container(
                      height: screenHeight * 0.15,
                      child: FloatingNavbar(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        backgroundColor: isDark != Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        borderRadius: 60,
                        selectedBackgroundColor: Colors.transparent,
                        items: [
                          FloatingNavbarItem(
                            customWidget: CustomeItemNavigation(
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.08,
                              color: _selectedIndex == 0
                                  ? Colors.white
                                  : Colors.transparent,
                              child: Icon(Icons.home,
                                  size: screenWidth * 0.06,
                                  color: _selectedIndex == 0
                                      ? isDark != Brightness.dark
                                          ? Colors.brown
                                          : Colors.grey
                                      : Colors.grey),
                            ),
                          ),
                          FloatingNavbarItem(
                            customWidget: CustomeItemNavigation(
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.08,
                              color: _selectedIndex == 1
                                  ? Colors.white
                                  : Colors.transparent,
                              child: Icon(Icons.shopping_bag,
                                  size: screenWidth * 0.06,
                                  color: _selectedIndex == 1
                                      ? isDark != Brightness.dark
                                          ? Colors.brown
                                          : Colors.grey
                                      : Colors.grey),
                            ),
                          ),
                          FloatingNavbarItem(
                            customWidget: CustomeItemNavigation(
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.08,
                              color: _selectedIndex == 2
                                  ? Colors.white
                                  : Colors.transparent,
                              child: Icon(Icons.favorite,
                                  size: screenWidth * 0.06,
                                  color: _selectedIndex == 2
                                      ? isDark != Brightness.dark
                                          ? Colors.brown
                                          : Colors.grey
                                      : Colors.grey),
                            ),
                          ),
                          FloatingNavbarItem(
                            customWidget: CustomeItemNavigation(
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.08,
                              color: _selectedIndex == 3
                                  ? Colors.white
                                  : Colors.transparent,
                              child: Icon(Icons.payment,
                                  size: screenWidth * 0.06,
                                  color: _selectedIndex == 3
                                      ? isDark != Brightness.dark
                                          ? Colors.brown
                                          : Colors.grey
                                      : Colors.grey),
                            ),
                          ),
                          FloatingNavbarItem(
                            customWidget: CustomeItemNavigation(
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.08,
                              color: _selectedIndex == 4
                                  ? Colors.white
                                  : Colors.transparent,
                              child: Icon(Icons.person,
                                  size: screenWidth * 0.06,
                                  color: _selectedIndex == 4
                                      ? isDark != Brightness.dark
                                          ? Colors.brown
                                          : Colors.grey
                                      : Colors.grey),
                            ),
                          ),
                        ],
                        currentIndex: _selectedIndex,
                        onTap: (int index) {
                          _onItemTapped(index);
                        },
                      ),
                    ),
                  )
                : Container(),
            Positioned(
              right: screenWidth * 0.02,
              bottom: screenHeight * 0.12,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                    )),
                child: IconButton(
                  onPressed: _togglenavbarVisibility,
                  icon: Icon(
                    _isHide
                        ? Icons.arrow_forward_ios
                        : Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
