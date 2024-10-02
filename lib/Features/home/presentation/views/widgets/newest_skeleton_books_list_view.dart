
import 'package:bookly/Features/home/presentation/views/widgets/newest_book_list_view_skeleton_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewestSkeletonBooksListView extends StatelessWidget {
  const NewestSkeletonBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: NewestBookListViewSkeletonItem(),
              );
            },
          ),
    );
  }
}