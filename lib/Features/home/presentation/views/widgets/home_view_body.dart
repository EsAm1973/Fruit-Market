import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/search_textfeild.dart';
import 'package:fruit_market/Features/home/presentation/views/widgets/home_custom_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeCustomAppBar(),
                SizedBox(height: 16),
                SearchTextfeild(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
