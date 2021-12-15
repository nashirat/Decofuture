// ignore_for_file: avoid_print, sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/core/constants/controllers.dart';
import 'package:decofuture2/core/icons/custom_icon.dart';
import 'package:decofuture2/features/main/data/product.dart';
import 'package:decofuture2/features/main/presentation/controller/helpers/show_loading.dart';
import 'package:decofuture2/features/main/presentation/pages/cart_page.dart';
import 'package:decofuture2/features/main/presentation/widgets/product_widgets/product_detail.dart';
import 'package:decofuture2/features/main/presentation/widgets/product_widgets/product_screenview/threedimension_screen.dart';
import 'package:decofuture2/features/main/presentation/widgets/product_widgets/product_screenview/twodimension_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_android/android_content.dart' as android_content;
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final Product product;
  static const routeName = '/ProductPage';

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ValueNotifier<bool> _is3dNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Stack(
            children: [
              ProductDetail(product: widget.product),
              Column(
                children: [
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 23.w),
                      Expanded(
                        child: Container(
                          width: width,
                          height: 385.h,
                          decoration: BoxDecoration(
                            color: greyFill,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(33.r),
                              topRight: Radius.circular(33.r),
                              bottomLeft: Radius.circular(50.r),
                              bottomRight: Radius.circular(50.r),
                            ),
                          ),
                          child: ValueListenableBuilder(
                            valueListenable: _is3dNotifier,
                            builder: (context, bool is3d, child) {
                              return Container(
                                child: is3d
                                    ? ThreeDView(product: widget.product)
                                    : TwoDView(product: widget.product),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 23.w),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: height / 2 - 110.h,
                right: 68.w,
                child: Container(
                  width: 55.w,
                  height: 70.w,
                  child: Bounceable(
                    duration: const Duration(milliseconds: 75),
                    reverseDuration: const Duration(milliseconds: 75),
                    scaleFactor: 0.85,
                    onTap: () {},
                    onTapUp: (_) async {
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
                                'file': widget.product.modelLink,
                                'mode': 'ar_only',
                              },
                            ),
                            package: "com.google.ar.core",
                            flags: 0x10000000, // Intent.FLAG_ACTIVITY_NEW_TASK,
                          );
                          await intent.startActivity();
                        } catch (error) {
                          Get.snackbar(
                              "AR Launch error", error.toString()); // DEBUG
                        }
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 7.5.w),
                      width: 55.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(50.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(0, 2),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Icon(
                        CustomIcon.ar_prev,
                        size: 30.sp,
                        color: selectedIconColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 22.h,
                child: Container(
                  width: width,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 43.w,
                      ),
                      Bounceable(
                        scaleFactor: 0.8,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 48.w,
                          height: 48.w,
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17.r),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/back.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        activeIcon: ImageIcon(
                          const AssetImage('assets/icons/3d.png'),
                          color: brown,
                        ),
                        inactiveIcon: ImageIcon(
                          const AssetImage('assets/icons/3d.png'),
                          color: Colors.grey.shade600.withOpacity(0.6),
                        ),
                        inactiveColor: Colors.grey.shade400.withOpacity(0.8),
                        activeColor: brown,
                        width: 47.w,
                        height: 28.w,
                        toggleSize: 20.r,
                        value: _is3dNotifier.value,
                        onToggle: (_) {
                          setState(() {
                            _is3dNotifier.value = !_is3dNotifier.value;
                          });
                        },
                      ),
                      const Spacer(),
                      Bounceable(
                        onTap: () {},
                        onTapUp: (_) async {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftJoined,
                              child: const CartPage(),
                              childCurrent: widget,
                              duration: const Duration(milliseconds: 300),
                              reverseDuration:
                                  const Duration(milliseconds: 300),
                            ),
                          );
                        },
                        duration: const Duration(milliseconds: 100),
                        reverseDuration: const Duration(milliseconds: 100),
                        scaleFactor: 0.7,
                        child: Container(
                          width: 48.w,
                          height: 48.w,
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Obx(
                            () => Badge(
                              showBadge: authController.cartItemList.isNotEmpty
                                  ? true
                                  : false,
                              toAnimate: false,
                              position:
                                  BadgePosition.topEnd(top: -12.h, end: -6.w),
                              padding: EdgeInsets.only(
                                top: 7.w,
                                left: 7.w,
                                right: 7.w,
                                bottom: 9.w,
                              ),
                              badgeColor: buttonColor,
                              badgeContent: AutoSizeText(
                                authController.cartItemList.length.toString(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: buttonText,
                                ),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/icons/bag.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 43.w,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30.h,
                child: Container(
                  width: width,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60.w,
                      ),
                      Expanded(
                        child: Bounceable(
                          onTap: () {
                            try {
                              authController.addToCart(
                                widget.product.id!,
                                widget.product.name!,
                                widget.product.imgf!,
                                widget.product.seller!,
                                widget.product.price!,
                                1,
                                authController.userModel.value.id!,
                                true,
                                widget.product,
                              );
                            } catch (e) {
                              Get.snackbar("Error", e.toString());
                            }
                          },
                          child: Container(
                            width: width,
                            height: 65.w,
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5.h),
                                  child: AutoSizeText(
                                    "Add to cart",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      color: buttonText,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
