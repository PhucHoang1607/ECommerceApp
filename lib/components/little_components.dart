import 'package:flutter/material.dart';

ButtonStyle buttonCustome = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        // Bo tròn 2 bên trái và phải
        left: Radius.circular(30), // Đặt bán kính cho bên trái
        right: Radius.circular(30), // Đặt bán kính cho bên phải
      ),
    ),
  ),
);

BoxDecoration buttonCircle = BoxDecoration(
    border: Border.all(color: Colors.black.withOpacity(0.2), width: 1),
    shape: BoxShape.circle,
    color: Colors.white,
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3))
    ]);
