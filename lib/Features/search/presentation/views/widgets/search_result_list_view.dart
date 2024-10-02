import 'package:bookly/Features/search/presentation/manager/book_search_cubit/book_search_cubit.dart';
import 'package:bookly/core/widgets/newest_books_list_view_item.dart';
import 'package:bookly/core/widgets/newest_skeleton_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchCubit, BookSearchState>(
      builder: (context, state) {
        if (state is BookSearchSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: NewestBookListViewItem(book: state.books[index]),
              );
            },
          );
        } else if (state is BookSearchLoading) {
          return const NewestSkeletonBooksListView();
        } else if (state is BookSearchNotFound) {
          return const Center(child: Text('Not Found'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
