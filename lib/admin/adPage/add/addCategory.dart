import 'dart:io';

import 'package:e_commerce_app_project/model/category.dart';
import 'package:e_commerce_app_project/services/admin/categoryF.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _image = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = pickedFile != null ? File(pickedFile.path) : null;
      _image.clear();
    });
  }

  // Future<void> _submitCategory() async {
  //   final imageUrl = _image.text.isNotEmpty ? _image.text : null;
  //   final File? imageFile = _selectedImage;
  //   final newCategory = imageUrl == null
  //       ? Category(
  //           name: _name.text,
  //           image: imageFile!.path,
  //           markedForDeletion: false,
  //         )
  //       : Category(
  //           name: _name.text,
  //           image: imageUrl,
  //           markedForDeletion: false,
  //         );

  //   if (imageUrl == null) {
  //     await addCategory(
  //         category: newCategory, imageFile: imageFile, imageUrl: '');
  //   } else {
  //     await addCategory(
  //         category: newCategory, imageUrl: imageUrl, imageFile: null);
  //   }
  // }

  Future<void> _submitCategory() async {
    if (_name.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter a category name.'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    final imageUrl = _image.text.isNotEmpty ? _image.text : null;
    final File? imageFile = _selectedImage;

    // Kiểm tra xem có ảnh không
    if (imageUrl == null && imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select or enter an image.'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    final newCategory = imageUrl == null
        ? Category(
            name: _name.text,
            image: imageFile!.path,
            markedForDeletion: false,
          )
        : Category(
            name: _name.text,
            image: imageUrl,
            markedForDeletion: false,
          );

    try {
      if (imageUrl == null) {
        await addCategory(category: newCategory, imageFile: imageFile);
      } else {
        await addCategory(category: newCategory, imageUrl: imageUrl);
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Category added successfully!'),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to add category: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  void dispose() {
    _image.dispose();
    _name.dispose();
    if (_selectedImage != null) {
      _selectedImage!.delete();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, keyboardSpace + 120),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _name,
                  maxLength: 50,
                  decoration:
                      const InputDecoration(label: Text('Category name')),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _image,
                  decoration: const InputDecoration(
                    label: Text('Image Url'),
                  ),
                ),
                _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        width: 80,
                        height: 80,
                      )
                    : Text('No Image selected'),
                ElevatedButton(
                    onPressed: _pickImage, child: Text('Pick Image')),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: _submitCategory,
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 20, color: Colors.yellow),
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel')),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
