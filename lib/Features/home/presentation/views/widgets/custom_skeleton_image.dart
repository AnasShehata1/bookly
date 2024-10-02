import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomBookSkeletonImage extends StatelessWidget {
  const CustomBookSkeletonImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: Image.asset(
            AssetsData.testImage,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
