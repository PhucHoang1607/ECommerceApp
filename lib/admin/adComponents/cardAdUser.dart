import 'package:flutter/material.dart';
import '../../model/user.dart';

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
      onTap: () {},
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
                  fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
            ),
            Text(user.email),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              children: [
                Text(user.phone),
                SizedBox(
                  width: screenWidth * 0.09,
                ),
                user.gender != '' ? Text(user.gender!) : const Text('Unknown')
              ],
            )
          ],
        ),
      ),
    );
  }
}
