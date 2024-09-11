import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView' ;
  static const kBookDetailsView = '/bookDetailsView' ;
  static final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashView();
      },
      ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) {
        return const HomeView();
      },
      ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) {
        return const BookDetailsView();
      },
      ),
  ],
);
}