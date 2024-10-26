import 'package:flutter/material.dart';

class WishListMainScreen extends StatefulWidget {
  const WishListMainScreen({super.key});

  @override
  State<WishListMainScreen> createState() => _WishListMainScreenState();
}

class _WishListMainScreenState extends State<WishListMainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Wish List Screen"),
    );
  }
}
