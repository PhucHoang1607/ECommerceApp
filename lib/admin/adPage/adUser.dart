import 'package:e_commerce_app_project/admin/adComponents/cardAdUser.dart';
import 'package:e_commerce_app_project/services/admin/userF.dart';
import 'package:flutter/material.dart';

class AdminUserPage extends StatefulWidget {
  const AdminUserPage({super.key});

  @override
  State<AdminUserPage> createState() => _AdminUserPageState();
}

class _AdminUserPageState extends State<AdminUserPage> {
  List<dynamic> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final getUserF = await getListUser();
    setState(() {
      _users = getUserF;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.04;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Page'),
        ),
        body: Container(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: _isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return CardUserAd(user: user);
                  },
                  itemCount: _users.length,
                ),
        ),
      ),
    );
  }
}
