import 'dart:io';

import 'package:e_commerce_app_project/services/admin/categoryF.dart';
import 'package:e_commerce_app_project/services/admin/productF.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class addProductAdP extends StatefulWidget {
  const addProductAdP({super.key});

  @override
  State<addProductAdP> createState() => _addProductAdPState();
}

class _addProductAdPState extends State<addProductAdP> {
  bool _isChangedIcon = false;
  bool _isMultiImageUrl = false;
  List<String> sizes = [];
  List<String> colors = [];

  List<String> imageUrls = [];
  List<File> imageFiles = [];

  List<dynamic> categories = [];
  String? selectedCategoryId;

  final _name = TextEditingController();
  final _description = TextEditingController();
  final _price = TextEditingController();
  final _color = TextEditingController();
  final _sizes = TextEditingController();
  final _countInStock = TextEditingController();
  final _genderAgecategory = TextEditingController();

  final _imageUrl = TextEditingController();
  File? _selectedImage;
  final _multiImageUrls = TextEditingController();
  File? _multiSelectedImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickMultipleImages() async {
    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages != null) {
      setState(() {
        imageFiles.addAll(selectedImages.map((xfile) => File(xfile.path)));
      });
    }
  }

  Future<void> _fetchCategories() async {
    final cateGetF = await getListCategory();
    setState(() {
      categories = cateGetF;
    });
  }

  Future<void> _submit() async {
    await addProduct(
                name: _name.text,
                description: _description.text,
                price: int.parse(_price.text),
                color: colors,
                sizes: sizes,
                category: selectedCategoryId!,
                genderAgecategory: _genderAgecategory.text,
                countInStock: int.parse(_countInStock.text),
                imageUrl: _imageUrl.text,
                imageUrls: imageUrls,
                imageFile: _selectedImage,
                imageDetails: imageFiles)
            .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully')),
      );
      Navigator.pop(context);
    })
        // .catchError((error) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('Failed to add product')),
        //   );
        // })
        ;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchCategories();
    _fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var fontSizeHeader = screenWidth * 0.06;
    var fontSizeMedium = screenWidth * 0.05;
    var fontSizeNormal = screenWidth * 0.04;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
          style: GoogleFonts.roboto(
              fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blueAccent),
                ),
                child: _isChangedIcon
                    ? Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isChangedIcon = !_isChangedIcon;
                                });
                              },
                              icon: const Icon(Icons.image)),
                          Text('Choose a file in your memory'),
                          IconButton(
                              onPressed: () {
                                _pickImage();
                              },
                              icon: const Icon(Icons.image_rounded)),
                          if (_selectedImage != null)
                            Image.file(_selectedImage!)
                          else
                            Text("No image selected")
                        ],
                      )
                    : Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isChangedIcon = !_isChangedIcon;
                                });
                              },
                              icon: const Icon(Icons.link)),
                          const Text('Enetr the Image Url'),
                          TextField(
                            controller: _imageUrl,
                            decoration:
                                InputDecoration(hintText: 'No Image Url'),
                          )
                        ],
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _name,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _description,
                decoration: InputDecoration(labelText: 'Décription'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _price,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: DropdownButton<String>(
                  hint: Text('Select Category'),
                  value: selectedCategoryId,
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category.id,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategoryId = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              sizeInput(),
              const SizedBox(
                height: 15,
              ),
              colorInput(),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _genderAgecategory,
                decoration: InputDecoration(labelText: "Gender Age Category"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _countInStock,
                decoration: InputDecoration(labelText: 'Count in Stock'),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add Image Details (Additional Images):"),

                  // Toggle between URL and file input
                  _isMultiImageUrl
                      ? Column(
                          children: [
                            TextField(
                              controller: _multiImageUrls,
                              decoration:
                                  InputDecoration(hintText: 'Enter Image URL'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  imageUrls.add(_multiImageUrls.text);
                                  _multiImageUrls.clear();
                                });
                              },
                              child: Text("Add URL"),
                            ),
                            ...imageUrls.map((url) => ListTile(
                                  title: Text(url),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        imageUrls.remove(url);
                                      });
                                    },
                                  ),
                                )),
                          ],
                        )
                      : Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await _pickMultipleImages();
                              },
                              child: Text("Choose Multiple Files"),
                            ),
                            ...imageFiles.map((file) => ListTile(
                                  title: Text(file.path.split('/').last),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        imageFiles.remove(file);
                                      });
                                    },
                                  ),
                                )),
                          ],
                        ),
                  SwitchListTile(
                    title: Text('Use URL for Images'),
                    value: _isMultiImageUrl,
                    onChanged: (bool value) {
                      setState(() {
                        _isMultiImageUrl = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _submit, child: Text('Submit')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget sizeInput() {
    return Column(
      children: [
        TextField(
          controller: _sizes,
          decoration: InputDecoration(labelText: "Add Size"),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              sizes.add(_sizes.text);
              _sizes.clear();
            });
          },
          child: Text("Add Size"),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: sizes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(sizes[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    sizes.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget colorInput() {
    return Column(
      children: [
        TextField(
          controller: _color,
          decoration: InputDecoration(labelText: "Add Color"),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              colors.add(_color.text);
              _color.clear();
            });
          },
          child: Text("Add Color"),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(colors[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    colors.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
