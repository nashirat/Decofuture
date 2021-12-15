import 'package:decofuture2/app_state.dart';
import 'package:decofuture2/features/main/data/category.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/category/single_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryCarouselWidget extends StatelessWidget {
  const CategoryCarouselWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) => Container(
        color: Colors.transparent,
        height: 100.w,
        width: width,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 30.w),
          separatorBuilder: (context, _) => SizedBox(
            width: 21.w,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: Category.categories.length,
          itemBuilder: (context, index) => Container(
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(vertical: 15.w),
            child: CategoryWidget(
              category: Category.categories[index],
            ),
          ),
        ),
      ),
    );
  }
}
