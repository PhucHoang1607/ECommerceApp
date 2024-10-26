import 'package:flutter/material.dart';

class MainCartScreen extends StatefulWidget {
  const MainCartScreen({super.key});

  @override
  State<MainCartScreen> createState() => _MainCartScreenState();
}

class _MainCartScreenState extends State<MainCartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Cart screen"),
    );
  }
}
