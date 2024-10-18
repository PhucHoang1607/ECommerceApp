import 'dart:async';

import 'package:e_commerce_app_project/page/started/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashedScreen extends StatefulWidget {
  const SplashedScreen({super.key});

  @override
  State<SplashedScreen> createState() => _SplashedScreenState();
}

class _SplashedScreenState extends State<SplashedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (page) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.brown),
              child: Text(
                "F",
                style: GoogleFonts.ptSerif(
                    textStyle: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Fashion",
              style: GoogleFonts.ptSerif(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
