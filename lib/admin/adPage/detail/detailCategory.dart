import 'package:e_commerce_app_project/model/category.dart';
import 'package:e_commerce_app_project/services/admin/categoryF.dart';
import 'package:flutter/material.dart';

class DetailCategoryAdP extends StatefulWidget {
  const DetailCategoryAdP(
      {super.key, required this.id, required this.category});

  final String id;
  final Category category;

  @override
  State<DetailCategoryAdP> createState() => _DetailCategoryAdPState();
}

class _DetailCategoryAdPState extends State<DetailCategoryAdP> {
  Future<void> deleteCateF() async {
    try {
      await deleteCategory(widget.id);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Category marked for deletion')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete category: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeNormal = screenWidth * 0.05;
    return LayoutBuilder(builder: (ctx, index) {
      final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, keyboardSpace + 300),
          child: Form(
            child: Column(
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                      fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.category.name,
                  style: TextStyle(
                      fontSize: fontSizeNormal, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.blueAccent)),
                  child: Image.network(
                    widget.category.image,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.image_not_supported),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Marked for deltetion',
                  style: TextStyle(
                      fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.category.markedForDeletion.toString(),
                  style: TextStyle(
                      color:
                          widget.category.markedForDeletion.toString() != true
                              ? Colors.blue
                              : Colors.red,
                      fontSize: fontSizeNormal,
                      fontWeight: FontWeight.w500),
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 255, 0, 13))),
                    onPressed: deleteCateF,
                    child: Text('Delete this category'))
              ],
            ),
          ),
        ),
      );
    });
  }
}
