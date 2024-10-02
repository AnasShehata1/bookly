
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_skeleton_image.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class NewestBookListViewSkeletonItem extends StatelessWidget {
  const NewestBookListViewSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 134,
      child: Row(
        children: [
          const CustomBookSkeletonImage(),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "book.volumeInfo.title",
                    style:
                        Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Text(
                  'Book Author',
                  style: Styles.textStyle14,
                ),
                Row(
                  children: [
                    Text(
                      'Free',
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const BookRating(rating: 0, count: 0)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
