import 'package:flutter/material.dart';
import 'package:fruit_market/Features/home/domain/entites/bottom_nav_bar_entity.dart';
import 'package:fruit_market/Features/home/presentation/views/widgets/nav_bar_active_item.dart';
import 'package:fruit_market/Features/home/presentation/views/widgets/nav_bar_inactive_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.entity,
  });
  final BottomNavBarEntity entity;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveIcon(iconPath: entity.activeIcon, name: entity.name)
        : InActiveIcon(iconPath: entity.inActiveIcon);
  }
}
