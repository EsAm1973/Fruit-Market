import 'package:fruit_market/Core/utils/assets.dart';

class BottomNavBarEntity {
  final String activeIcon, inActiveIcon;
  final String name;

  BottomNavBarEntity({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.name,
  });
}

List<BottomNavBarEntity> get bottomNavBarItems => <BottomNavBarEntity>[
  BottomNavBarEntity(
    activeIcon: Assets.imagesHomeiconFilled,
    inActiveIcon: Assets.imagesHomeiconOutlined,
    name: 'الرئيسية',
  ),
  BottomNavBarEntity(
    activeIcon: Assets.imagesProductsiconFilled,
    inActiveIcon: Assets.imagesProductsiconOutlined,
    name: 'المنتجات',
  ),
  BottomNavBarEntity(
    activeIcon: Assets.imagesCarticonFilled,
    inActiveIcon: Assets.imagesCarticonOutlined,
    name: 'السلة',
  ),
  BottomNavBarEntity(
    activeIcon: Assets.imagesProfileiconFilled,
    inActiveIcon: Assets.imagesProfileiconOutlined,
    name: 'الحساب',
  ),
];
