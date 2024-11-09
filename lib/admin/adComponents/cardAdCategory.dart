import 'package:e_commerce_app_project/admin/adPage/detail/detailCategory.dart';
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
        builder: (ctx) => DetailCategoryAdP(
              id: widget.category.id!,
              category: widget.category,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openDetailCategoryOverlay,
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
