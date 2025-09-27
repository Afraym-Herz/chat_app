import 'package:bookly_app_/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app_/core/widgets/error_text.dart';
import 'package:bookly_app_/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_/features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly_app_/features/home/presentation/views/widgets/best_seller_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerBooksState>(
      builder: (context, state) {
        if (state is BestSellerBooksSuccess){
          return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.books.length ,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric( vertical: 8.0),
              child: BestSellerListItem(
                bookModel: state.books[index] ,
              ),
            );
          },
        );
        } else if (state is BestSellerBooksFailure){
          return ErrorText(errMessage: state.errMessage) ;
        }
        else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
