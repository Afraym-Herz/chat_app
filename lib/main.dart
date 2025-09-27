import 'package:bookly_app_/constants.dart';
import 'package:bookly_app_/core/utils/AppRouters.dart';
import 'package:bookly_app_/core/utils/services_locator.dart';
import 'package:bookly_app_/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_/features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly_app_/features/home/presentation/manager/featured_book_cubit.dart/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUpServicesLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBookCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks() ),
        BlocProvider(
            create: (context) => BestSellerCubit(getIt.get<HomeRepoImpl>())..fetchBestSellerBooks() ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
