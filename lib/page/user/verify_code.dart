import 'package:e_commerce_app_project/components/little_components.dart';
import 'package:e_commerce_app_project/page/user/forget_password.dart';
import 'package:e_commerce_app_project/page/user/new_password.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyCodeEmailPage extends StatefulWidget {
  const VerifyCodeEmailPage({super.key, required this.email});

  final String email;

  @override
  State<VerifyCodeEmailPage> createState() => _VerifyCodeEmailPageState();
}

class _VerifyCodeEmailPageState extends State<VerifyCodeEmailPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    // TODO: implement dispose
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _verifyOtp() async {
    String otp = _controllers.map((controller) => controller.text).join();

    if (otp.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the full 4-digit OTP')),
      );
      return;
    }

    final message = await verifyPasswordResetOTP(widget.email, otp);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));

    if (message == 'OTP confirmed successfully') {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (page) => NewPasswordScreen(email: widget.email)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some function work error unexpected')));
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
        body: Stack(children: [
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Verify OTP",
                    style: GoogleFonts.roboto(
                        fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Please enter the code we just sent to email',
                    style: TextStyle(
                      color: isDark == Brightness.dark
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.email,
                    style: TextStyle(
                        fontSize: fontSizeNormal,
                        color: isDark != Brightness.dark
                            ? Colors.brown
                            : const Color.fromARGB(255, 255, 106, 51)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Container(
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: isDark != Brightness.dark
                                ? Colors.brown
                                : const Color.fromARGB(255, 255, 106, 51),
                          ),
                        ),
                        child: TextField(
                          controller: _controllers[index],
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(counterText: ""),
                          onChanged: (value) {
                            if (value.length == 1 && index < 4) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Didn\'t receive OTP ? '),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (page) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      "Back to resend Code",
                      style: GoogleFonts.roboto(
                          fontSize: fontSizeNormal,
                          color: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenWidth * 0.05,
                    height: screenHeight * 0.03,
                    child: ElevatedButton(
                        style: buttonCustome,
                        onPressed: _verifyOtp,
                        child: Text(
                          'Verify',
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        )),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
