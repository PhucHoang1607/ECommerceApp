import 'package:e_commerce_app_project/model/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardOrderAd extends StatelessWidget {
  const CardOrderAd({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isDark = MediaQuery.of(context).platformBrightness;
    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;
    return InkWell(
      onTap: () {},
      child: Container(
        //color: Colors.grey.shade100,
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.grey.shade300)),
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order ${order.id.substring(0, 4)}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: fontSizeHeader,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Status: ${order.status.name}',
                    style: TextStyle(
                        fontSize: fontSizeNormal,
                        color: Colors.brown,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateFormat('dd/mm/yyy').format(order.dateOrdered!),
                    style: TextStyle(
                        fontSize: fontSizeNormal,
                        color: Colors.brown,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 0.5, color: Colors.white)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.amber,
                        ))),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 0.5, color: Colors.white)),
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
