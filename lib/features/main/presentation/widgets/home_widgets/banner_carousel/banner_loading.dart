// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

class BannerLoading extends StatelessWidget {
  const BannerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 155.h,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 30.w),
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (context, _) => SizedBox(
          width: 21.w,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade300,
              child: Container(
                width: 340.w,
                height: 155.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
