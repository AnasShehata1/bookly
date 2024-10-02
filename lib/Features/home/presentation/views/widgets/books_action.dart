import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_button.dart';
import 'package:bookly/core/helper/show_msg_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () async {
                Uri uri = Uri.parse(book.accessInfo!.pdf!.acsTokenLink!);
                if (await canLaunchUrl(uri)) {
                  launchUrl(uri);
                } else {
                  if (context.mounted) {
                    snackBarMsg(context, 'Unable to Download Book');
                  }
                }
              },
              text: 'Download',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              text: 'Preview',
              fontSize: 16,
              onPressed: () async {
                Uri uri = Uri.parse(book.volumeInfo.previewLink!);
                if (await canLaunchUrl(uri)) {
                  launchUrl(uri);
                } else {
                  if (context.mounted) {
                    snackBarMsg(context, 'Unable to Preview Book');
                  }
                }
              },
              backgroundColor: const Color(0xffef8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
