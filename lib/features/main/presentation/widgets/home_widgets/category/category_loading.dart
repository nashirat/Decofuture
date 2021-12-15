import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 70.w,
      width: width,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 30.w),
          separatorBuilder: (context, _) => SizedBox(
                width: 21.w,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext context, index) {
            if (index == 0) {
              return Container(
                width: 70.w,
                height: 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.grey.shade400,
                ),
                child: Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade50,
                    child: Container(
                      width: 25.w,
                      height: 25.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 70.w,
                  height: 70.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.grey.shade200,
                  ),
                ),
              );
            }
          }
          // child: if (index ) Container(
          //   width: 70.w,
          //   height: 70.w,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50.r),
          //     color: Colors.grey.shade400,
          //   ),
          //   child: Center(
          //     child: Container(
          //       width: 25.w,
          //       height: 25.w,
          //       decoration: BoxDecoration(
          //         color: Colors.grey.shade50,
          //         borderRadius: BorderRadius.circular(50.r),
          //       ),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
