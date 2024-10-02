import 'package:bookly/Features/search/presentation/manager/book_search_cubit/book_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    String book = '';
    return TextField(
      onChanged: (value) {
        book = value;
        if (book != '') {
          BlocProvider.of<BookSearchCubit>(context).getBooks(bookTitle: book);
        }
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        prefixIcon: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            FontAwesomeIcons.xmark,
            color: Colors.white70,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () async {
            if (book.isNotEmpty) {
              BlocProvider.of<BookSearchCubit>(context)
                  .getBooks(bookTitle: book);
            }
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white24),
    );
  }
}
