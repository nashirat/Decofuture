// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:decofuture2/features/main/data/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:decofuture2/core/constants/colors.dart';

class ProductMeasurement extends StatelessWidget {
  const ProductMeasurement({
    Key? key,
    required this.width,
    required this.product,
  }) : super(key: key);

  final double width;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 55.w,
              ),
              Expanded(
                child: Container(
                  child: AutoSizeText(
                    "Product Measurements",
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                      color: nakedText,
                      letterSpacing: -0.75,
                      shadows: [
                        Shadow(
                          color: nakedText,
                          offset: const Offset(0.13, 0.13),
                        ),
                        Shadow(
                          color: nakedText,
                          offset: const Offset(-0.13, -0.13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 55.w,
                ),
                Expanded(
                  child: Container(
                    width: width,
                    child: AutoSizeText(
                      "Length:",
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.sp,
                        letterSpacing: -0.4,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Container(
                    width: width,
                    child: AutoSizeText(
                      '${product.length} cm',
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.sp,
                        letterSpacing: -0.4,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 75.w,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 55.w,
                ),
                Expanded(
                  child: Container(
                    width: width,
                    child: AutoSizeText(
                      "Width:",
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.sp,
                        letterSpacing: -0.4,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Container(
                    width: width,
                    child: AutoSizeText(
                      '${product.width} cm',
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.sp,
                        letterSpacing: -0.4,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 75.w,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 55.w,
                ),
                Expanded(
                  child: Container(
                    width: width,
                    child: AutoSizeText(
                      "Height:",
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.sp,
                        letterSpacing: -0.4,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Container(
                    width: width,
                    child: AutoSizeText(
                      '${product.height} cm',
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.sp,
                        letterSpacing: -0.4,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 75.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
