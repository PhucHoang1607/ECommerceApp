import 'package:e_commerce_app_project/model/order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailOrderAdP extends StatefulWidget {
  const DetailOrderAdP({super.key, required this.id, required this.order});

  final String id;
  final Order order;

  @override
  State<DetailOrderAdP> createState() => _DetailOrderAdPState();
}

class _DetailOrderAdPState extends State<DetailOrderAdP> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isDark = MediaQuery.of(context).platformBrightness;
    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeMedium = screenWidth * 0.05;
    var fontSizeNormal = screenWidth * 0.04;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order number ${widget.order.id.substring(0, 4)} Detail"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Order ${widget.order.id.substring(0, 4)}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          color: Colors.amberAccent,
                          fontSize: fontSizeHeader,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.order.shippingAdress,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Status: ${widget.order.status.toString().split('.').last}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Phone: ${widget.order.phone}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Date Ordered:  \n ${widget.order.dateOrdered!.toIso8601String()}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Positioned(
                top: _isExpanded ? 100 : 600, // Adjust as needed
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: 800,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 240, 194, 137),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Order Items',
                            style: GoogleFonts.roboto(
                              fontSize: fontSizeHeader,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                              icon: Icon(
                                _isExpanded
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                              ))
                        ],
                      ),
                      _isExpanded
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: widget.order.orderItems.length,
                                  itemBuilder: (context, index) {
                                    final orderItem =
                                        widget.order.orderItems[index];
                                    return ListTile(
                                      leading: Image.network(
                                        orderItem.productImage,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                      title: Text(
                                        orderItem.productName,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      subtitle: Text(
                                        " ${NumberFormat("#,##0", "vi_VN").format(orderItem.productPrice)} VND",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      trailing: Text(
                                        'Qty: ${orderItem.quantity}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    );
                                  }),
                            )
                          : const Text('Push Up to see the list')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
