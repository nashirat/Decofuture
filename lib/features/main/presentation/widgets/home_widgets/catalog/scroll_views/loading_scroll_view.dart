import 'package:decofuture2/features/main/presentation/widgets/home_widgets/banner_carousel/banner_loading.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/catalog/catalog_title_loading.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/category/category_loading.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/recommend/recommend_carousel_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScrollView extends StatelessWidget {
  const LoadingScrollView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return const BannerLoading();
            },
            childCount: 1,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 32.h),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CategoryLoading(width: width);
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
              return RecLoading(width: width);
            },
            childCount: 1,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 40.h),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 30.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const CatalogTitleLoading();
              },
              childCount: 1,
            ),
          ),
        ),
      ],
    );
  }
}
