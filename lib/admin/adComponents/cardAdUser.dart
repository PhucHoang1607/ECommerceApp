import 'package:e_commerce_app_project/admin/adPage/detail/detailUser.dart';
import 'package:flutter/material.dart';
import '../../model/user.dart';
import 'package:google_fonts/google_fonts.dart';

class CardUserAd extends StatelessWidget {
  const CardUserAd({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (page) => DetailUserAdP(id: user.id, user: user)));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
        child: Card(
          child: Column(
            children: [
              Image.asset(
                'asset/icon/user.png',
                width: screenWidth * 0.1,
                height: screenHeight * 0.1,
              ),
              Text(
                user.name,
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
              Text(
                user.email,
                style: GoogleFonts.roboto(fontSize: screenWidth * 0.03),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                children: [
                  Text(
                    user.phone,
                    style: TextStyle(fontSize: screenWidth * 0.035),
                  ),
                  SizedBox(
                    width: screenWidth * 0.06,
                  ),
                  user.gender != ''
                      ? Text(
                          user.gender!,
                          style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500),
                        )
                      : Text('Unknown',
                          style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
