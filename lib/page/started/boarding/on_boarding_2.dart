import 'package:e_commerce_app_project/page/user/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isDark = MediaQuery.of(context).platformBrightness;

    double fontSizeHeader = screenWidth * 0.07;
    double fontSizeNormal = screenWidth * 0.04;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            height: screenHeight * 0.2,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (page) => SignUpScreen(),
                  ),
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.yellow)),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
              ),
              children: [
                TextSpan(
                  text: "Wishlist: Where ",
                  style: TextStyle(
                      color: isDark != Brightness.dark
                          ? Colors.black
                          : Colors.white),
                ),
                TextSpan(
                    text: "Fashion Dreams ",
                    style: TextStyle(
                      color: isDark != Brightness.dark
                          ? Colors.brown
                          : Color.fromARGB(255, 255, 106, 51),
                    )),
                TextSpan(
                  text: "Begin",
                  style: TextStyle(
                      color: isDark != Brightness.dark
                          ? Colors.black
                          : Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type",
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: fontSizeNormal,
                  color: Color.fromARGB(255, 93, 90, 90),
                  fontWeight: FontWeight.w600),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
