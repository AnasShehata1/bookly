import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/repo/repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final Repo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) => emit(NewestBooksFailure(failure.errMessage)),
        (books) => emit(NewestBooksSuccess(books)));
  }
}
