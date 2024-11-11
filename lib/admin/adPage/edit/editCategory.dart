import 'package:e_commerce_app_project/model/category.dart';
import 'package:e_commerce_app_project/services/admin/categoryF.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditCategoryAdP extends StatefulWidget {
  const EditCategoryAdP({super.key, required this.id, required this.category});

  final String id;
  final Category category;

  @override
  State<EditCategoryAdP> createState() => _EditCategoryAdPState();
}

class _EditCategoryAdPState extends State<EditCategoryAdP> {
  final _name = TextEditingController();
  //final _color = TextEditingController();
  final _image = TextEditingController();

  void _loadCategory() {
    if (widget.category != null) {
      setState(() {
        _name.text = widget.category.name;
        //_color.text = widget.category.;
        _image.text = widget.category.image;
      });
    }
  }

  Future<void> editCateF() async {
    if (_name.text.isEmpty || _image.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    try {
      await editCategory(
        widget.category.id!,
        _name.text,
        //_color.text, // Uncomment this line if you use _color
        _image.text,
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Category edited successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to edit category: ${e.toString()}')),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCategory();
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
          padding: EdgeInsets.fromLTRB(16, 0, 16, keyboardSpace + 200),
          child: Column(
            children: [
              TextField(
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045),
                controller: _name,
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045),
                controller: _image,
                decoration: InputDecoration(
                    labelText: 'Image',
                    labelStyle: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: editCateF, child: const Text('Submit')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
