import 'package:bookly_app_/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app_/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app_/core/utils/styles.dart';
import 'package:bookly_app_/features/home/presentation/views/widgets/feature_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics:  BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  FeatureListViewItem(),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Best Sellers",
                    style: Styles.textStyle18,
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: BestSellerListViewItem(),
            ),
          ),
        ],
      ),
    );
  }
}
