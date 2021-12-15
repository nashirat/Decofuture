// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/core/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width - 75.w,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(45.r),
          bottomRight: Radius.circular(45.r),
        ),
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.w),
                  width: width,
                  height: 85.h,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: const Offset(0, 8),
                                blurRadius: 15,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(17.w),
                            child: Container(
                              width: 45.w,
                              height: 45.w,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/close.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  height: 90.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25.w,
                      ),
                      Container(
                        width: 62.w,
                        height: 62.w,
                        decoration: BoxDecoration(
                          color: selectedIconColor,
                          borderRadius: BorderRadius.circular(100.r),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/prof.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Container(
                          height: 90.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      authController.userModel.value.name![0]
                                              .toUpperCase() +
                                          authController.userModel.value.name!
                                              .substring(1),
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w700,
                                        color: nakedText,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      authController.userModel.value.email![0]
                                              .toLowerCase() +
                                          authController.userModel.value.email!
                                              .substring(1),
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        // fontWeight: FontWeight.w700,
                                        color: greyFillFoc,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    authController.signOut();
                  },
                  child: Container(
                    width: width,
                    height: 90.h,
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: AutoSizeText(
                                            'Sign out',
                                            style: TextStyle(
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w700,
                                              color: nakedText,
                                              letterSpacing: -0.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: AutoSizeText(
                                            'Sign out or switch account',
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              color: greyText,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 50.w,
                          height: 90.h,
                          padding: EdgeInsets.all(13.w),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/logout.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
