// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:decofuture2/features/main/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.width,
    required this.product,
  }) : super(key: key);

  final double width;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: width,
            child: Row(
              children: [
                SizedBox(
                  width: 55.w,
                ),
                Expanded(
                  child: Container(
                    width: width,
                    child: AutoSizeText(
                      product.detail!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.sp,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: width,
            child: Row(
              children: [
                SizedBox(
                  width: 55.w,
                ),
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(product.userProfile!),
                    ),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Container(
                    width: width,
                    child: AutoSizeText(
                      product.seller!,
                      maxLines: 1,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 20.sp,
                        letterSpacing: -0.4,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 55.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
