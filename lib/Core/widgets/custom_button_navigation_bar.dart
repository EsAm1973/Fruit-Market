import 'package:flutter/material.dart';
import 'package:fruit_market/Features/home/domain/entites/bottom_nav_bar_entity.dart';
import 'package:fruit_market/Features/home/presentation/views/widgets/nav_bar_item.dart';

class CustomButtonNavigationBar extends StatefulWidget {
  const CustomButtonNavigationBar({super.key});

  @override
  State<CustomButtonNavigationBar> createState() =>
      _CustomButtonNavigationBarState();
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children:
            bottomNavBarItems.asMap().entries.map((e) {
              var index = e.key;
              var value = e.value;
              return Expanded(
                flex: selectedIndex == index ? 2 : 1,
                child: GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: NavigationBarItem(
                    isSelected: selectedIndex == index,
                    entity: value,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
