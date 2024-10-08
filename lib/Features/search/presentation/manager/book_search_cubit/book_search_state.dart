part of 'book_search_cubit.dart';

sealed class BookSearchState extends Equatable {
  const BookSearchState();

  @override
  List<Object> get props => [];
}

final class BookSearchInitial extends BookSearchState {}

final class BookSearchLoading extends BookSearchState {}

final class BookSearchSuccess extends BookSearchState {
  final List<BookModel> books;

  const BookSearchSuccess(this.books);
}

final class BookSearchNotFound extends BookSearchState {}
