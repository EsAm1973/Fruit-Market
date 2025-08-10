import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/custom_button_navigation_bar.dart';
import 'package:fruit_market/Features/home/presentation/views/home_view.dart';
import 'package:fruit_market/Features/products/presentation/views/products_view.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeView(),
    const ProductsView(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: CustomButtonNavigationBar(
        selectedIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
