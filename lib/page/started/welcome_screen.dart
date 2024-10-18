import 'package:e_commerce_app_project/components/little_components.dart';
import 'package:e_commerce_app_project/page/started/boarding/main_boarding.dart';
import 'package:e_commerce_app_project/page/user/sign_in.dart';
import 'package:e_commerce_app_project/page/user/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin về kích thước của màn hình
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isDark = MediaQuery.of(context).platformBrightness;

    double fontSizeHeader = screenWidth * 0.065;
    double fontSizeNormal = screenWidth * 0.045;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  // Hình ảnh đầu tiên với kích thước dựa trên kích thước màn hình
                  Container(
                    width: screenWidth * 0.45, // 50% chiều rộng của màn hình
                    height: screenHeight * 0.5, // 40% chiều cao của màn hình
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(100), // Bo góc lớn hơn
                    ),
                    clipBehavior: Clip.hardEdge, // Cắt hình ảnh theo góc bo
                    child: Image.asset(
                      "asset/image/welcome1.jpg",
                      fit: BoxFit.cover, // Đảm bảo hình ảnh phù hợp với khung
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            "asset/image/welcome.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            "asset/image/welcome2.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                //alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: fontSizeHeader,
                          fontWeight: FontWeight.bold,
                          //color: Colors.black
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: "The ",
                          style: TextStyle(
                              color: isDark != Brightness.dark
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        TextSpan(
                          text: "Fashion App ",
                          style: TextStyle(
                            color: isDark != Brightness.dark
                                ? Colors.brown
                                : Color.fromARGB(255, 255, 106, 51),
                          ),
                        ),
                        TextSpan(
                          text: "That Makes you Look Your Best",
                          style: TextStyle(
                              color: isDark != Brightness.dark
                                  ? Colors.black
                                  : Colors.white),
                        )
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.06,
                //decoration: ,
                //clipBehavior: Clip.hardEdge,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (page) => MainBoarding(),
                      ),
                    );
                  },
                  style: buttonCustome,
                  child: Text(
                    'Let\'s get started',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You already have an account!",
                    style: TextStyle(fontSize: fontSizeNormal),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (page) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: fontSizeNormal),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
