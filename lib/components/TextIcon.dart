import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  const TextIcon({super.key, this.textIcon, required this.textName});

  final String textName;
  final IconData? textIcon;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness;
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeNormal = screenWidth * 0.045;
    return Row(
      children: [
        Icon(
          textIcon,
          size: screenWidth * 0.06,
          color: isDark != Brightness.dark
              ? Colors.brown
              : const Color.fromARGB(255, 255, 106, 51),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          textName,
          style:
              TextStyle(fontSize: fontSizeNormal, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
