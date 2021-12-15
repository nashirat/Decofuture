import 'package:decofuture2/app_state.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/features/main/data/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.id;

    return Bounceable(
      duration: const Duration(milliseconds: 75),
      reverseDuration: const Duration(milliseconds: 75),
      scaleFactor: 0.85,
      onTapDown: (_) {
        if (!isSelected) {
          appState.updateCategoryId(category.id);
        }
      },
      onTap: () {},
      child: AnimatedContainer(
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 150),
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
          color: isSelected ? buttonColor : greyFill,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: isSelected
              ? ([
                  BoxShadow(
                    color: buttonColor.withOpacity(0.5),
                    offset: const Offset(0, 2),
                    blurRadius: 10,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, -10),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ])
              : ([
                  BoxShadow(
                    color: Colors.red.withOpacity(0),
                  )
                ]),
        ),
        child: AnimatedContainer(
          curve: Curves.bounceIn,
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.all(14.w),
          child: Container(
            width: 25.w,
            height: 25.w,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: isSelected
                      ? AssetImage(category.selectedIcon)
                      : AssetImage(category.icon),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
