import 'package:bookly_app_/core/utils/styles.dart';
import 'package:bookly_app_/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app_/features/home/presentation/views/widgets/custom_row_rating.dart';
import 'package:bookly_app_/features/home/presentation/views/widgets/row_actions_book.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.17),
          child:  CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '' ,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title ?? '' ,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.subtitle ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const CustomRowRating(mainAxisAlignment: MainAxisAlignment.center, count: 0 , rating:0 , ),
        const SizedBox(
          height: 37,
        ),
         RowActionsBook(bookModel: bookModel,),
      ],
    );
  }
}
