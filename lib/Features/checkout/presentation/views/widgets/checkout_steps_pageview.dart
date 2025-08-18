import 'package:flutter/material.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }
}
