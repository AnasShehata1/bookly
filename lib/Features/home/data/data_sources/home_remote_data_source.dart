import 'package:bookly/Features/home/data/models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookModel>>fetchNewestBooks();
  Future<List<BookModel>> fetchFeaturedBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookModel>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}