// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'dart:io';
import 'package:decofuture2/core/icons/custom_icon.dart';
import 'package:decofuture2/features/main/presentation/pages/product_detail_page.dart';
import 'package:flutter_android/android_content.dart' as android_content;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/features/main/data/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class ProductCatalog extends StatelessWidget {
  const ProductCatalog({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.03),
            offset: const Offset(0, -10),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0, 0.6),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 155.h,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      greyFillSec.withAlpha(500),
                      greyFill,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(product.imgr!),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 2.w),
                width: 200.w,
                child: AutoSizeText(
                  product.name!,
                  maxLines: 1,
                  style: TextStyle(
                    color: nakedText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 2.w),
                width: 200.w,
                child: AutoSizeText(
                  product.seller!,
                  maxLines: 1,
                  style: TextStyle(
                    color: greyText,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 2.w),
                width: 200.w,
                child: AutoSizeText(
                  NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0)
                      .format(product.price),
                  maxLines: 1,
                  style: TextStyle(
                    color: nakedText.withOpacity(0.9),
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Bounceable(
              duration: const Duration(milliseconds: 75),
              reverseDuration: const Duration(milliseconds: 75),
              scaleFactor: 0.85,
              onTap: () {},
              onTapDown: (_) async {
                await Future.delayed(const Duration(milliseconds: 75), () {});
                if (Platform.isAndroid) {
                  try {
                    final intent = android_content.Intent(
                      action:
                          "android.intent.action.VIEW", // Intent.ACTION_VIEW
                      data:
                          Uri.parse("https://arvr.google.com/scene-viewer/1.0")
                              .replace(
                        queryParameters: <String, dynamic>{
                          'file': product.modelLink,
                          'mode': 'ar_only',
                        },
                      ),
                      package: "com.google.ar.core",
                      flags: 0x10000000, // Intent.FLAG_ACTIVITY_NEW_TASK,
                    );
                    await intent.startActivity();
                  } catch (error) {
                    print(
                        '>>>> ModelViewer failed to launch AR: $error'); // DEBUG
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(9),
                child: Icon(
                  CustomIcon.ar_prev,
                  size: 12.sp,
                  color: selectedIconColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
