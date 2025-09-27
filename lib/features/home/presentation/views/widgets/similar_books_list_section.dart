import 'package:bookly_app_/features/home/presentation/views/widgets/similar_list_view_books.dart';
import 'package:flutter/material.dart';

class SimilarBooksListSection extends StatelessWidget {
  const SimilarBooksListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("You can also like"),
        SimilarListViewBooks(),
      ],
    );
  }
}
