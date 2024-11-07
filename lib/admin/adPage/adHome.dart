import 'package:e_commerce_app_project/admin/adComponents/cardAdHome.dart';
import 'package:e_commerce_app_project/admin/adPage/adCategory.dart';
import 'package:e_commerce_app_project/admin/adPage/adOrder.dart';
import 'package:e_commerce_app_project/admin/adPage/adProduct.dart';
import 'package:e_commerce_app_project/admin/adPage/adUser.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Home Page'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardAdminHome(
                iconHome: Icons.category,
                nameHome: 'Category',
                functionPage: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (page) => const AdminCategoryPage()));
                },
              ),
              const SizedBox(
                width: 20,
              ),
              CardAdminHome(
                iconHome: FontAwesomeIcons.productHunt,
                nameHome: 'Product',
                functionPage: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (page) => const AdminProductPage()));
                },
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardAdminHome(
                iconHome: FontAwesomeIcons.firstOrder,
                nameHome: 'Orders',
                functionPage: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (page) => const AdminOrderPage()));
                },
              ),
              const SizedBox(
                width: 20,
              ),
              CardAdminHome(
                iconHome: FontAwesomeIcons.person,
                nameHome: 'Users',
                functionPage: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (page) => const AdminUserPage()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
