import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    this.finalFileImage,
    required this.radius,
    this.onPressed,
  });

  final File? finalFileImage;
  final double radius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return finalFileImage == null
        ? Stack(
            children: [
              CircleAvatar(
                radius: radius,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.asset(
                      "asset/icon/user.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: onPressed,
                    child: const CircleAvatar(
                        backgroundColor: Colors.brown,
                        child: Icon(
                          Icons.camera,
                          color: Colors.white,
                          size: 20,
                        )),
                  ))
            ],
          )
        : Stack(
            children: [
              InkWell(
                onTap: onPressed,
                child: CircleAvatar(
                  radius: radius,
                  backgroundImage: FileImage(File(finalFileImage!.path)),
                ),
              ),
              const Positioned(
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.brown,
                  child: Icon(
                    FontAwesomeIcons.penToSquare,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          );
  }
}
