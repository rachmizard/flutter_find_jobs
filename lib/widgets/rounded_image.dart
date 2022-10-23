import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imageUrl;

  const RoundedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff4141A4)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          image: AssetImage(imageUrl),
          width: 58,
          height: 58,
        ),
      ),
    );
  }
}
