import 'package:e_commerce_app_project/admin/adComponents/cardAdOrder.dart';
import 'package:e_commerce_app_project/services/admin/orderF.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:flutter/material.dart';

class AdminOrderPage extends StatefulWidget {
  const AdminOrderPage({super.key});

  @override
  State<AdminOrderPage> createState() => _AdminOrderPageState();
}

class _AdminOrderPageState extends State<AdminOrderPage> {
  List<dynamic> _orders = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fectOrders();
  }

  Future<void> _fectOrders() async {
    final getOrderF = await getListOrder();
    setState(() {
      _orders = getOrderF;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isDark = MediaQuery.of(context).platformBrightness;
    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: _isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  final order = _orders[index];
                  return CardOrderAd(order: order);
                }),
      ),
    ));
  }
}
