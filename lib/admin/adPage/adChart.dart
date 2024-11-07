import 'package:flutter/material.dart';

class AdminChartPage extends StatefulWidget {
  const AdminChartPage({super.key});

  @override
  State<AdminChartPage> createState() => _AdminChartPageState();
}

class _AdminChartPageState extends State<AdminChartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Chart', style: TextStyle(fontSize: 24)));
  }
}
