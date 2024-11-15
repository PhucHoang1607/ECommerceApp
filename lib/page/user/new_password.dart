import 'package:e_commerce_app_project/components/CustomeTextFormField.dart';
import 'package:e_commerce_app_project/components/little_components.dart';
import 'package:e_commerce_app_project/page/user/sign_in.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool isHide = true;
  final _passwordController = TextEditingController();
  final _comfirmPassController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _comfirmPassController.dispose();
  }

  Future<void> _submitResetpassword() async {
    String newPassword = _passwordController.text;
    if (newPassword != _comfirmPassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Please check again the password or the confirm password')));
      return;
    }

    final result = await resetPassword(widget.email, newPassword);
    if (result == 'Password reset successfully') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Password has been reset successfully. Please log in again after 10 second!')),
      );

      await Future.delayed(Duration(seconds: 10));

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something wrong !!!')));
    }
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
      body: Stack(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'New Password',
                    style: GoogleFonts.roboto(
                        fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Your new password must be different from previously used passwords.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fontSizeNormal,
                        color: isDark != Brightness.dark
                            ? Colors.grey
                            : Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Password",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Stack(children: [
                    CustomeTextFormField(
                      textInputAction: TextInputAction.next,
                      hintText: "Please Enter your new password",
                      borderColor: isDark != Brightness.dark
                          ? Colors.brown
                          : const Color.fromARGB(255, 255, 106, 51),
                      focusedBorderColor: isDark != Brightness.dark
                          ? Colors.brown
                          : const Color.fromARGB(255, 255, 106, 51),
                      controller: _passwordController,
                      obscureText: isHide,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isHide = !isHide;
                          });
                        },
                        icon: Icon(
                            isHide ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Confirm Password",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Stack(children: [
                    CustomeTextFormField(
                      textInputAction: TextInputAction.next,
                      hintText: "Confirm your new password",
                      borderColor: isDark != Brightness.dark
                          ? Colors.brown
                          : const Color.fromARGB(255, 255, 106, 51),
                      focusedBorderColor: isDark != Brightness.dark
                          ? Colors.brown
                          : const Color.fromARGB(255, 255, 106, 51),
                      controller: _comfirmPassController,
                      obscureText: isHide,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isHide = !isHide;
                          });
                        },
                        icon: Icon(
                            isHide ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.06,
                    child: ElevatedButton(
                        style: buttonCustome,
                        onPressed: _submitResetpassword,
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
