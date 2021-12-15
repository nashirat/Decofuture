// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/features/main/data/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
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
            height: 78.h,
          ),
          Material(
            type: MaterialType.transparency,
            child: Container(
              width: width,
              child: Row(
                children: [
                  SizedBox(
                    width: 55.w,
                  ),
                  Expanded(
                    child: Container(
                      child: AutoSizeText(
                        NumberFormat.simpleCurrency(
                                locale: 'id_ID', decimalDigits: 0)
                            .format(product.price),
                        maxLines: 1,
                        style: TextStyle(
                          color: nakedText.withOpacity(0.9),
                          fontSize: 26.sp,
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
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            width: width,
            child: Row(
              children: [
                SizedBox(
                  width: 55.w,
                ),
                AutoSizeText(
                  product.name!,
                  maxLines: 1,
                  style: TextStyle(
                    color: nakedText.withOpacity(0.9),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
