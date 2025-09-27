import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app_/features/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerBooksState> {
  BestSellerCubit(this.homeRepoImpl) : super(BestSellerBookInitial());

  final HomeRepoImpl homeRepoImpl;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerBooksLoading());

    var result = await homeRepoImpl.fetchBestSellerBooks();

    result.fold((failure) {
      emit(BestSellerBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(BestSellerBooksSuccess(books: books));
    });
  }

}
