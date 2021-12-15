import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String icon;
  final String selectedIcon;

  const Category(
      {required this.id,
      required this.name,
      required this.icon,
      required this.selectedIcon});

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
      ];

  static List<Category> categories = [
    Category(
      id: 0,
      name: "All",
      icon: 'assets/icons/category/all.png',
      selectedIcon: 'assets/icons/category/selall.png',
    ),
    Category(
      id: 1,
      name: "Cushion",
      icon: 'assets/icons/category/sofa.png',
      selectedIcon: 'assets/icons/category/selsofa.png',
    ),
    Category(
      id: 2,
      name: "Drawer",
      icon: 'assets/icons/category/drawer.png',
      selectedIcon: 'assets/icons/category/seldrawer.png',
    ),
    Category(
      id: 3,
      name: "Bed",
      icon: 'assets/icons/category/bed.png',
      selectedIcon: 'assets/icons/category/selbed.png',
    ),
    Category(
      id: 4,
      name: "Chair",
      icon: 'assets/icons/category/chair.png',
      selectedIcon: 'assets/icons/category/selchair.png',
    ),
    Category(
      id: 5,
      name: "Wall",
      icon: 'assets/icons/category/gorden.png',
      selectedIcon: 'assets/icons/category/selgorden.png',
    ),
  ];
}
