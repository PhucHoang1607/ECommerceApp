import 'package:e_commerce_app_project/admin/adComponents/cardAdProduct.dart';
import 'package:e_commerce_app_project/model/product.dart';
import 'package:e_commerce_app_project/services/admin/productF.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:flutter/material.dart';

class AdminProductPage extends StatefulWidget {
  const AdminProductPage({super.key});

  @override
  State<AdminProductPage> createState() => _AdminProductPageState();
}

class _AdminProductPageState extends State<AdminProductPage> {
  List<dynamic> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final getProductF = await getProductList(page: 1, pageSize: 20);

    setState(() {
      _products = getProductF;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text('Product Page'),
              Expanded(
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return CardProductAd(
                      product: product,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          foregroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
