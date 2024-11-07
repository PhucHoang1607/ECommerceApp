import 'package:e_commerce_app_project/admin/adComponents/cardAdCategory.dart';
import 'package:e_commerce_app_project/services/admin/categoryF.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:flutter/material.dart';

class AdminCategoryPage extends StatefulWidget {
  const AdminCategoryPage({super.key});

  @override
  State<AdminCategoryPage> createState() => _AdminCategoryPageState();
}

class _AdminCategoryPageState extends State<AdminCategoryPage> {
  List<dynamic> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fectCategories();
  }

  Future<void> _fectCategories() async {
    final token = await getAccessToken();
    final getCateF = await getListCategory(token.toString());
    setState(() {
      _categories = getCateF;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: _isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return CardCategoryAd(category: category);
                  },
                  itemCount: _categories.length,
                ),
        ),
      ),
    );
  }
}
