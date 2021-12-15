import 'package:animations/animations.dart';
import 'package:decofuture2/app_state.dart';
import 'package:decofuture2/core/constants/controllers.dart';
import 'package:decofuture2/features/main/presentation/pages/product_detail_page.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/recommend/recommend_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RecCarouselWidget extends StatelessWidget {
  const RecCarouselWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) => Container(
        color: Colors.transparent,
        height: 265.h,
        padding: EdgeInsets.only(bottom: 0.h),
        width: width,
        child: Obx(
          () => ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 30.w),
            separatorBuilder: (context, _) => SizedBox(
              width: 25.w,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: productController.products
                .where((item) =>
                    item.category!.contains(appState.selectedCategoryId))
                .toList()
                .length,
            itemBuilder: (context, index) => OpenContainer(
              transitionDuration: const Duration(milliseconds: 400),
              closedElevation: 0,
              openElevation: 0,
              closedColor: Colors.transparent,
              openColor: Colors.transparent,
              transitionType: ContainerTransitionType.fade,
              middleColor: Colors.transparent,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              openShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              closedBuilder: (context, VoidCallback openContainer) =>
                  ProductWidget(
                      product: productController
                          .products
                          .where((item) => item.category!
                              .contains(appState.selectedCategoryId))
                          .toList()[index]),
              openBuilder: (context, _) => ProductPage(
                  product: productController.products
                      .where((item) =>
                          item.category!.contains(appState.selectedCategoryId))
                      .toList()[index]),
            ),
          ),
        ),
      ),
    );
  }
}
