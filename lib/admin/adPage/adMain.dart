import 'package:e_commerce_app_project/admin/adPage/adChart.dart';
import 'package:e_commerce_app_project/admin/adPage/adHome.dart';
import 'package:e_commerce_app_project/admin/adPage/adOrder.dart';
import 'package:e_commerce_app_project/admin/adPage/adProduct.dart';
import 'package:e_commerce_app_project/admin/adPage/adUser.dart';
import 'package:flutter/material.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AdminHome(),
    AdminProductPage(),
    AdminOrderPage(),
    AdminUserPage(),
    AdminChartPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[900], // Nền xanh đen cho ứng dụng
        scaffoldBackgroundColor: Colors.blueGrey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[800],
          elevation: 0,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.blueGrey[800],
        ),
        iconTheme: IconThemeData(color: Colors.blue[200]),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white60),
          titleLarge: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Admin Panel',
              textAlign: TextAlign.center,
            ),
          ),
          drawer: Container(
            width: 200,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                    ),
                    child: const Text(
                      'Admin Menu',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 21),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(),
                        child: Image.asset("asset/icon/user.png"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Name Admin'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  _buildDrawerItem(Icons.dashboard, 'Dashboard', 0),
                  _buildDrawerItem(Icons.people, 'Users', 1),
                  _buildDrawerItem(Icons.shopping_bag, 'Products', 2),
                  _buildDrawerItem(Icons.shopping_cart, 'Orders', 3),
                  _buildDrawerItem(Icons.settings, 'Settings', 4),
                ],
              ),
            ),
          ),
          body: _pages[_selectedIndex],
        ),
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[200]),
      title: Text(title, style: TextStyle(color: Colors.white70)),
      selected: _selectedIndex == index,
      selectedTileColor: Colors.blueGrey[700],
      onTap: () => _onItemTapped(index),
    );
  }
}
