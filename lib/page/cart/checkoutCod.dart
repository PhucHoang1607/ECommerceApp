import 'package:e_commerce_app_project/model/cart_product.dart';
import 'package:e_commerce_app_project/services/user/checkoutF.dart';
import 'package:flutter/material.dart';

class CheckoutCodScreen extends StatefulWidget {
  final List<CartProduct> cartProducts;

  CheckoutCodScreen({required this.cartProducts});

  @override
  _CheckoutCodScreenState createState() => _CheckoutCodScreenState();
}

class _CheckoutCodScreenState extends State<CheckoutCodScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  bool _isLoading = false;

  void _handleCheckout() async {
    if (_addressController.text.isEmpty || _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await checkoutCod(
          widget.cartProducts,
          _addressController.text,
          _cityController.text,
          _postalCodeController.text,
          _countryController.text,
          _phoneController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Order placed successfully!")),
      );
      Navigator.of(context).pop();
      //Navigate to success page or clear cart
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to place order: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.cartProducts.fold(
      0,
      (sum, item) => sum + (item.productPrice * item.quantity!.toInt()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout COD'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Cart',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.cartProducts.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartProducts[index];
                      return ListTile(
                        title: Text(item.productName),
                        subtitle: Text('Quantity: ${item.quantity}'),
                        trailing: Text(
                            '${(item.productPrice * item.quantity!.toInt()).toStringAsFixed(2)} VND'),
                      );
                    },
                  ),
                  Divider(),
                  Text(
                    'Total: ${totalPrice.toStringAsFixed(2)} VND',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(labelText: 'Shipping Address'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Your City'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _postalCodeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Postal Code in your country'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _handleCheckout,
                    child: Text('Place Order (COD)'),
                  ),
                ],
              ),
            ),
    );
  }
}
