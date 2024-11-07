import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  const CardAdminHome(
      {super.key,
      required this.iconHome,
      required this.nameHome,
      required this.functionPage});

  final IconData iconHome;
  final String nameHome;
  final Function() functionPage;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.4,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white24),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3))
        ],
      ),
      child: InkWell(
        onTap: functionPage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconHome),
            Text(nameHome),
          ],
        ),
      ),
    );
  }
}
