import 'package:e_commerce_app_project/page/started/boarding/on_boarding_1.dart';
import 'package:e_commerce_app_project/page/started/boarding/on_boarding_2.dart';
import 'package:e_commerce_app_project/page/started/boarding/on_boarding_3.dart';
import 'package:e_commerce_app_project/page/user/sign_up.dart';
import 'package:flutter/material.dart';

class MainBoarding extends StatefulWidget {
  const MainBoarding({super.key});

  @override
  State<MainBoarding> createState() => _MainBoardingState();
}

class _MainBoardingState extends State<MainBoarding> {
  int _currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _page = [
    OnBoarding1(),
    OnBoarding2(),
    OnBoarding3(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isDark = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _page,
          ),
          Positioned(
            bottom: screenHeight * 0.08,
            right: screenWidth * 0.05,
            child: FloatingActionButton(
              heroTag: "Forward",
              onPressed: () {
                if (_currentIndex < _page.length - 1) {
                  _pageController.animateToPage(
                    _currentIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (page) => SignUpScreen()));
                }
              },
              shape: CircleBorder(),
              backgroundColor: isDark != Brightness.dark
                  ? Colors.brown
                  : const Color.fromARGB(255, 255, 106, 51),
              foregroundColor: Colors.white,
              child: const Icon(
                Icons.arrow_forward,
              ),
            ),
          ),
          _currentIndex > 0
              ? Positioned(
                  bottom: screenHeight * 0.08,
                  left: screenWidth * 0.05,
                  child: FloatingActionButton(
                    heroTag: "Backward",
                    onPressed: () {
                      if (_currentIndex > 0) {
                        _pageController.animateToPage(
                          _currentIndex - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    shape: CircleBorder(
                        side: BorderSide(
                      width: 2,
                      color: isDark != Brightness.dark
                          ? Colors.brown
                          : const Color.fromARGB(255, 255, 106, 51),
                    )),
                    backgroundColor: Colors.white,
                    foregroundColor: isDark != Brightness.dark
                        ? Colors.brown
                        : const Color.fromARGB(255, 255, 106, 51),
                    child: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                )
              : Container(),
          Positioned(
            bottom: screenHeight * 0.1,
            left: screenWidth * 0.44,
            child: Row(
              children: List.generate(_page.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51)
                          : Colors.grey),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
