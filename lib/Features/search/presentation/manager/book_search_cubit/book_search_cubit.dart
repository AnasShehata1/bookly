import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/repo/repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_search_state.dart';

class BookSearchCubit extends Cubit<BookSearchState> {
  BookSearchCubit(this.repo) : super(BookSearchInitial());
  final Repo repo;
  Future<void> getBooks({required String bookTitle}) async {
    emit(BookSearchLoading());
    var result = await repo.getBooks(bookTitle: bookTitle);
    result.fold((failure) => emit(BookSearchNotFound()),
        (books) => emit(BookSearchSuccess(books)));
  }
}
