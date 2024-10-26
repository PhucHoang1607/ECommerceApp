import 'package:e_commerce_app_project/components/CustomeTextFormField.dart';
import 'package:e_commerce_app_project/components/little_components.dart';
import 'package:e_commerce_app_project/page/user/personal_information.dart';
import 'package:e_commerce_app_project/page/user/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _comfirmPasswordController = TextEditingController();
  bool? isChecked = false;

  bool _isObscure = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
        body: SingleChildScrollView(
          padding:
              EdgeInsets.only(top: screenHeight * 0.08, left: 10, right: 10),
          child: Container(
            // width: double.infinity,
            // height: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Create Account",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeHeader)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: screenWidth * 0.7,
                  child: Text(
                    "Fill your information below or register with your social account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isDark != Brightness.dark
                          ? Colors.grey
                          : Colors.lightBlueAccent,
                      fontSize: fontSizeNormal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        CustomeTextFormField(
                          controller: _passwordController,
                          textInputAction: TextInputAction.done,
                          hintText: "Please enter password",
                          keyboardType: TextInputType.text,
                          obscureText: _isObscure,
                          borderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
                          focusedBorderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Comfirm Password",
                      style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        CustomeTextFormField(
                          controller: _comfirmPasswordController,
                          textInputAction: TextInputAction.done,
                          hintText: "Please comfirm your password",
                          keyboardType: TextInputType.text,
                          obscureText: _isObscure,
                          borderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
                          focusedBorderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  //padding: EdgeInsets.only(right: screenWidth * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                          value: isChecked,
                          visualDensity: VisualDensity.compact,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value;
                            });
                          }),
                      Text(
                        "Agree with ",
                        style: TextStyle(fontSize: fontSizeNormal),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Terms & Condition",
                          style: TextStyle(
                            color: isDark != Brightness.dark
                                ? Colors.brown
                                : const Color.fromARGB(255, 255, 106, 51),
                            fontSize: fontSizeNormal,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    style: buttonCustome,
                    onPressed: () {
                      //Where you have to make Sign In to Home Page with real Data
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (page) => PersonalInformation()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.22,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 2, color: Colors.grey))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Or sign up with",
                      style: TextStyle(
                          fontSize: fontSizeNormal,
                          fontWeight: FontWeight.w500,
                          color: isDark != Brightness.dark
                              ? Colors.grey
                              : Colors.lightBlueAccent),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: screenWidth * 0.22,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 2, color: Colors.grey))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.15,
                      height: screenWidth * 0.15,
                      decoration: buttonCircle,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.apple,
                          size: screenWidth * 0.08,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.1,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Google test");
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: screenWidth * 0.15,
                        height: screenWidth * 0.15,
                        decoration: buttonCircle,
                        child: Image.asset(
                          "asset/icon/google.png",
                          width: screenWidth * 0.01,
                          height: screenHeight * 0.01,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.1,
                    ),
                    Container(
                      width: screenWidth * 0.15,
                      height: screenWidth * 0.15,
                      decoration: buttonCircle,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.facebookF,
                          color: const Color.fromARGB(255, 35, 9, 237),
                          size: screenWidth * 0.065,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(
                            fontSize: fontSizeNormal,
                            fontWeight: FontWeight.w500,
                            color: isDark != Brightness.dark
                                ? Colors.grey
                                : Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (page) => SignInScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: fontSizeNormal,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
