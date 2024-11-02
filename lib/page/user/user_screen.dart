import 'package:e_commerce_app_project/components/CircleImage.dart';
import 'package:e_commerce_app_project/components/TextIcon.dart';
import 'package:e_commerce_app_project/other/help_center.dart';
import 'package:e_commerce_app_project/other/settings.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var isDark = MediaQuery.of(context).platformBrightness;

    double fontSizeHeader = screenWidth * 0.065;
    double fontSizeNormal = screenWidth * 0.045;
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Profile",
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  CircleImage(
                    radius: 50,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your Name",
                style: TextStyle(
                    fontSize: fontSizeHeader, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.05,
                margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                child: InkWell(
                  splashColor: isDark != Brightness.dark
                      ? Colors.grey[300]
                      : Colors.grey[700],
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextIcon(
                          textIcon: Icons.person_2_outlined,
                          textName: "Your Profile"),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: isDark == Brightness.dark
                              ? Colors.grey.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1))),
                ),
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.05,
                margin: EdgeInsets.only(
                    bottom: screenHeight * 0.005, top: screenHeight * 0.005),
                child: InkWell(
                  splashColor: isDark != Brightness.dark
                      ? Colors.grey[300]
                      : Colors.grey[700],
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextIcon(
                          textIcon: Icons.view_list_outlined,
                          textName: "My Order"),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: isDark == Brightness.dark
                              ? Colors.grey.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1))),
                ),
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.05,
                margin: EdgeInsets.only(
                    bottom: screenHeight * 0.005, top: screenHeight * 0.005),
                child: InkWell(
                  splashColor: isDark != Brightness.dark
                      ? Colors.grey[300]
                      : Colors.grey[700],
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (page) => SettingScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextIcon(textIcon: Icons.settings, textName: "Settings"),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: isDark == Brightness.dark
                              ? Colors.grey.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1))),
                ),
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.05,
                margin: EdgeInsets.only(
                    bottom: screenHeight * 0.005, top: screenHeight * 0.005),
                child: InkWell(
                  splashColor: isDark != Brightness.dark
                      ? Colors.grey[300]
                      : Colors.grey[700],
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (page) => HelpCenter()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextIcon(
                          textIcon: Icons.warning_rounded,
                          textName: "Help Center"),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: isDark == Brightness.dark
                              ? Colors.grey.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1))),
                ),
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.05,
                margin: EdgeInsets.only(
                    bottom: screenHeight * 0.005, top: screenHeight * 0.005),
                child: InkWell(
                  splashColor: isDark != Brightness.dark
                      ? Colors.grey[300]
                      : Colors.grey[700],
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextIcon(
                          textIcon: Icons.lock_clock_rounded,
                          textName: "Privacy Policy"),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: isDark == Brightness.dark
                              ? Colors.grey.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1))),
                ),
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.05,
                margin: EdgeInsets.only(
                    bottom: screenHeight * 0.005, top: screenHeight * 0.005),
                child: InkWell(
                  splashColor: isDark != Brightness.dark
                      ? Colors.grey[300]
                      : Colors.grey[700],
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextIcon(
                          textIcon: Icons.logout_rounded, textName: "Log out"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: isDark == Brightness.dark
                              ? Colors.grey.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
