import 'package:animations/animations.dart';
import 'package:decofuture2/core/constants/controllers.dart';
import 'package:decofuture2/features/main/presentation/pages/home_page.dart';
import 'package:decofuture2/features/main/presentation/pages/product_detail_page.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/banner_carousel/banner_carousel.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/catalog/catalog_product.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/catalog/catalog_title.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/category/category_carousel.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/recommend/recommend_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FinishedScrollView extends StatelessWidget {
  const FinishedScrollView({
    Key? key,
    required this.widget,
    required this.width,
  }) : super(key: key);

  final HomePage widget;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const BannerWidget();
              },
              childCount: 1,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 15.h),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CategoryCarouselWidget(width: width);
              },
              childCount: 1,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 15.h),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return RecCarouselWidget(width: width);
              },
              childCount: 1,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 30.h),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const MoreFurniture();
              },
              childCount: 1,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 30.h),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.w,
                mainAxisSpacing: 20.w,
                crossAxisSpacing: 20.w,
                mainAxisExtent: 265.h,
              ),
              // delegate: SliverChildBuilderDelegate(
              //   (BuildContext context, int index) {
              //     return ProductCatalog(
              //       product: productController.products[index],
              //     );
              //   },
              //   childCount: productController.products.length,
              // ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => OpenContainer(
                  transitionDuration: Duration(milliseconds: 400),
                  closedElevation: 0,
                  openElevation: 0,
                  closedColor: Colors.white,
                  openColor: Colors.white,
                  transitionType: ContainerTransitionType.fade,
                  middleColor: Colors.white,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  openShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  closedBuilder: (context, VoidCallback openContainer) =>
                      ProductCatalog(
                          product: productController.products[index]),
                  openBuilder: (context, _) =>
                      ProductPage(product: productController.products[index]),
                ),
                childCount: productController.products.length,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 140.h),
          ),
        ],
      ),
    );
  }
}
