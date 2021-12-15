// ignore_for_file: avoid_unnecessary_containers, avoid_print, import_of_legacy_library_into_null_safe

import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/core/icons/custom_icon.dart';
import 'package:decofuture2/features/main/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_android/android_content.dart' as android_content;
import 'package:intl/intl.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                  top: 14.w, left: 14.w, right: 14.w, bottom: 14.w),
              height: 212.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(62.r),
                  topRight: Radius.circular(62.r),
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 200.w,
                        height: 90.h,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              greyFillSec.withAlpha(500),
                              greyFill,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(45.r),
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
                            fontSize: 20.sp,
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
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2.w),
                        width: 200.w,
                        child: AutoSizeText(
                          NumberFormat.simpleCurrency(
                                  locale: 'id_ID', decimalDigits: 0)
                              .format(product.price),
                          maxLines: 1,
                          style: TextStyle(
                            color: nakedText.withOpacity(0.9),
                            fontSize: 17.sp,
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
                        await Future.delayed(
                            const Duration(milliseconds: 75), () {});
                        if (Platform.isAndroid) {
                          try {
                            final intent = android_content.Intent(
                              action:
                                  "android.intent.action.VIEW", // Intent.ACTION_VIEW
                              data: Uri.parse(
                                      "https://arvr.google.com/scene-viewer/1.0")
                                  .replace(
                                queryParameters: <String, dynamic>{
                                  'file': product.modelLink,
                                  'mode': 'ar_only',
                                },
                              ),
                              package: "com.google.ar.core",
                              flags:
                                  0x10000000, // Intent.FLAG_ACTIVITY_NEW_TASK,
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
                          size: 16.sp,
                          color: selectedIconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -42.h,
            right: 10.w,
            child: Container(
              padding: EdgeInsets.all(24.w),
              width: 200.w,
              height: 200.h,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(product.imgr!),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
