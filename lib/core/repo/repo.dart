import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Repo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
  Future<Either<Failure, List<BookModel>>> getBooks(
      {required String bookTitle});
}
