import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_search_state.dart';

class BookSearchCubit extends Cubit<BookSearchState> {
  BookSearchCubit(this.homeRepo) : super(BookSearchInitial());
  final HomeRepo homeRepo;
  Future<void> getBooks({required String bookTitle}) async {
    emit(BookSearchLoading());
    var result = await homeRepo.getBooks(bookTitle: bookTitle);
    result.fold((failure) => emit(BookSearchNotFound()),
        (books) => emit(BookSearchSuccess(books)));
  }
}
