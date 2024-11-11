import 'package:e_commerce_app_project/model/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailUserAdP extends StatefulWidget {
  const DetailUserAdP({super.key, required this.id, required this.user});

  final String id;
  final User user;

  @override
  State<DetailUserAdP> createState() => _DetailUserAdPState();
}

class _DetailUserAdPState extends State<DetailUserAdP> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeMedium = screenWidth * 0.05;
    var fontSizeNormal = screenWidth * 0.04;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.user.name} detail",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'asset/icon/user.png',
                width: screenWidth * 0.3,
                height: screenHeight * 0.2,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(widget.user.name,
                  style: GoogleFonts.roboto(
                      color: Colors.cyanAccent,
                      fontSize: fontSizeHeader,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white)),
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Text(
                    widget.user.phone,
                    style: GoogleFonts.roboto(fontSize: fontSizeMedium),
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Container(
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.user.email,
                style: GoogleFonts.roboto(fontSize: fontSizeMedium),
              ),
              const SizedBox(
                height: 20,
              ),
              widget.user.gender != ''
                  ? Text(
                      'Gender: ${widget.user.gender}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(fontSize: fontSizeMedium),
                    )
                  : Text(
                      'Gender:  \n Unknown',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(fontSize: fontSizeMedium),
                    ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              widget.user.address != ''
                  ? Text(
                      'Address \n ${widget.user.address}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(fontSize: fontSizeMedium),
                    )
                  : Text(
                      'Address \n No Address User',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(fontSize: fontSizeMedium),
                    ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                'WishList',
                style: GoogleFonts.roboto(
                    fontSize: fontSizeHeader,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
              const SizedBox(
                height: 15,
              ),
              widget.user.wishlists != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.user.wishlists!.length,
                      itemBuilder: (context, index) {
                        final wishListItems = widget.user.wishlists![index];
                        print(
                            'TOtal wishList: ${widget.user.wishlists!.length}');
                        print(
                            'Image: ${wishListItems.productImage.toString()}');
                        return Container(
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.all(5),
                          width: double.infinity,
                          height: screenHeight * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200],
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  wishListItems.productImage,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      wishListItems.productName,
                                      style: GoogleFonts.roboto(
                                          fontSize: fontSizeMedium,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange),
                                    ),
                                    Text(
                                      "${NumberFormat("#,##0", "vi_VN").format(wishListItems.productPrice)} VND",
                                      style: GoogleFonts.roboto(
                                          fontSize: fontSizeNormal,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ]),
                        );
                      })
                  : Text(
                      'No product in wish list',
                      style: GoogleFonts.roboto(
                          fontSize: fontSizeHeader,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
            ],
          ),
        ),
      ),
    ));
  }
}
