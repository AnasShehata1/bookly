import 'dart:developer';

import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repo/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
      List<BookModel> books = [];
      for (var book in data['items']) {
        try {
          books.add(BookModel.fromJson(book));
        } catch (e) {
          log(book.toString());
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks &q=artificial intelligence');
      List<BookModel> books = [];
      for (var book in data['items']) {
        try {
          books.add(BookModel.fromJson(book));
        } catch (e) {
          log(book.toString());
        }
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=$category');
      List<BookModel> books = [];
      for (var book in data['items']) {
        try {
          books.add(BookModel.fromJson(book));
        } catch (e) {
          log(book.toString());
        }
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getBooks(
      {required String bookTitle}) async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$bookTitle');
      List<BookModel> books = [];
      for (var book in data['items']) {
        try {
          books.add(BookModel.fromJson(book));
        } catch (e) {
          log(book.toString());
        }
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
