import 'package:e_commerce_app_project/admin/adPage/detail/detailCategory.dart';
import 'package:e_commerce_app_project/admin/adPage/edit/editCategory.dart';
import 'package:e_commerce_app_project/model/category.dart';
import 'package:flutter/material.dart';

class CardCategoryAd extends StatefulWidget {
  const CardCategoryAd({super.key, required this.category});

  final Category category;

  @override
  State<CardCategoryAd> createState() => _CardCategoryAdState();
}

class _CardCategoryAdState extends State<CardCategoryAd> {
  _openDetailCategoryOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 1, 32, 57),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: DetailCategoryAdP(
                id: widget.category.id!,
                category: widget.category,
              ),
            ));
  }

  _openEditCategoryOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: EditCategoryAdP(
                id: widget.category.id!,
                category: widget.category,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openDetailCategoryOverlay,
      onLongPress: _openEditCategoryOverlay,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              widget.category.image,
              width: 60,
              height: 60,
              errorBuilder: (context, index, trackError) =>
                  const Icon(Icons.category),
            ),
            Text(
              widget.category.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
