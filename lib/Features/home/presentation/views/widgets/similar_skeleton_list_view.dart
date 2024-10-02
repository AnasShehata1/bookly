import 'package:bookly/Features/home/presentation/views/widgets/custom_skeleton_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SimilarSkeletonListView extends StatelessWidget {
  const SimilarSkeletonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.14,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomBookSkeletonImage(),
            );
          },
        ),
      ),
    );
  }
}
