import 'package:bookly_app_/Features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:bookly_app_/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app_/features/home/presentation/views/widgets/similar_books_list_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBarBookDetails(),
              BookDetailsSection(
                bookModel: bookModel,
              ),
              const Expanded(
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SimilarBooksListSection(),
            ],
          ),
        ),
      ),); 
  
  }
}
