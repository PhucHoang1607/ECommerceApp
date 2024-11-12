import 'package:e_commerce_app_project/components/CustomeTextFormField.dart';
import 'package:e_commerce_app_project/components/little_components.dart';
import 'package:e_commerce_app_project/page/user/verify_code.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _email = TextEditingController();

  void _handleForgetPassword() async {
    final email = _email.text;
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email")),
      );
      return;
    }

    final message = await forgetPassword(email);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    Navigator.of(context).push(MaterialPageRoute(
        builder: (page) => VerifyCodeEmailPage(email: _email.text)));
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
        body: Center(
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  width: screenWidth * 0.12,
                  height: screenWidth * 0.12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1,
                          color: isDark != Brightness.dark
                              ? Colors.brown
                              : Colors.orange)),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.2),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Forget the password ?',
                        style: GoogleFonts.roboto(
                            fontSize: fontSizeHeader,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Please enter your email to have your verify code ',
                        style: GoogleFonts.roboto(
                            color: isDark == Brightness.dark
                                ? Colors.white
                                : Colors.grey,
                            fontSize: fontSizeNormal,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Email",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomeTextFormField(
                        textInputAction: TextInputAction.next,
                        hintText: "Please Enter your email",
                        borderColor: isDark != Brightness.dark
                            ? Colors.brown
                            : const Color.fromARGB(255, 255, 106, 51),
                        focusedBorderColor: isDark != Brightness.dark
                            ? Colors.brown
                            : const Color.fromARGB(255, 255, 106, 51),
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: buttonCustome,
                          onPressed: _handleForgetPassword,
                          child: Text('Next'))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
