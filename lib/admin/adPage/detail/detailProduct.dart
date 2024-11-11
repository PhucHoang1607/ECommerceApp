import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_project/model/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailProductAdP extends StatefulWidget {
  const DetailProductAdP({super.key, required this.id, required this.product});

  final String id;
  final Product product;

  @override
  State<DetailProductAdP> createState() => _DetailProductAdPState();
}

class _DetailProductAdPState extends State<DetailProductAdP> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.05;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail ${widget.product.name}",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(screenWidth * 0.05),
                width: screenWidth * 0.5,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white)),
                child: Image.network(
                  widget.product.image,
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.3,
                  fit: BoxFit.cover,
                ),
              ),

              Text(
                "Price: ${NumberFormat("#,##0", "vi_VN").format(widget.product.price)} VND",
                style: TextStyle(
                    fontSize: fontSizeNormal, color: Colors.blueAccent),
              ),

              SizedBox(height: screenHeight * 0.04),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Stock \n ${widget.product.countInStock}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fontSizeNormal, color: Colors.redAccent),
                  ),
                  if (widget.product.dateAdded != null)
                    Text(
                      "Date Added \n ${widget.product.dateAdded!.toLocal().toString().split(' ')[0]}",
                      style: TextStyle(
                          fontSize: fontSizeNormal, color: Colors.grey[400]),
                    ),
                ],
              ),

              const SizedBox(height: 16.0),

              // Ngày thêm vào

              // Phân loại giới tính/độ tuổi
              if (widget.product.genderAgecategory != null)
                Text(
                  "Category by Gender/Age: ${widget.product.genderAgecategory.toString().split('.').last}",
                  style: TextStyle(
                      fontSize: fontSizeNormal, color: Colors.grey[400]),
                ),

              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                children: [
                  Text(
                    'Available Color: ',
                    style: TextStyle(fontSize: fontSizeHeader),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  if (widget.product.color != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.product.color!.map((hexColor) {
                        Color color = Color(
                            int.parse(hexColor.replaceFirst('#', '0xFF')));
                        return Container(
                          width: screenWidth * 0.07,
                          height: screenHeight * 0.07,
                          margin: EdgeInsets.only(right: screenWidth * 0.05),
                          decoration: BoxDecoration(
                              color: color, shape: BoxShape.circle),
                        );
                      }).toList(),
                    ),
                ],
              ),

              SizedBox(
                height: screenHeight * 0.03,
              ),

              Text(
                'Size',
                style: TextStyle(
                    fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
              ),
              if (widget.product.sizes != null)
                Wrap(
                  spacing: 8,
                  children: widget.product.sizes!.map((size) {
                    return Chip(
                      label: Text(
                        size,
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.grey[200],
                    );
                  }).toList(),
                ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                'Description',
                style: TextStyle(
                    fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
              ),

              Text(
                widget.product.description.isNotEmpty
                    ? widget.product.description
                    : "This the product for anyone who one to change the look, make you feel comfortable and confidence in the way you like",
                style: TextStyle(fontSize: fontSizeNormal),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
