import 'dart:io';

import 'package:e_commerce_app_project/components/CircleImage.dart';
import 'package:e_commerce_app_project/components/CustomeTextFormField.dart';
import 'package:e_commerce_app_project/components/little_components.dart';
import 'package:e_commerce_app_project/page/home.dart';
import 'package:e_commerce_app_project/page/main_cover_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  File? userImage;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;

    var isDark = MediaQuery.of(context).platformBrightness;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          // height: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: screenWidth * 0.005,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: isDark != Brightness.dark
                          ? Colors.brown
                          : const Color.fromARGB(255, 255, 106, 51),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.1),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Complete Your Profile",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: fontSizeHeader,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: screenWidth * 0.8,
                      child: Text(
                        "Don't worry, only you can see your personal data. No one else will be able to see it",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fontSizeNormal,
                          color: isDark != Brightness.dark
                              ? Colors.grey
                              : Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: CircleImage(
                        finalFileImage: userImage,
                        radius: 50,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomeTextFormField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          hintText: "Your Name",
                          borderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
                          focusedBorderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
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
                          "Phone Number",
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomeTextFormField(
                          controller: _phoneController,
                          hintText: "Your phone number",
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          borderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
                          focusedBorderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
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
                          "Address",
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomeTextFormField(
                          controller: _addressController,
                          hintText: "Your address",
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          borderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
                          focusedBorderColor: isDark != Brightness.dark
                              ? Colors.brown
                              : const Color.fromARGB(255, 255, 106, 51),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: buttonCustome,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (page) => MainCoverScreen()));
                        },
                        child: Text(
                          "Complete Profile",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
