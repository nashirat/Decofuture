// ignore_for_file: sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/core/constants/controllers.dart';
import 'package:decofuture2/features/main/presentation/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: AutoSizeText(
              'Sign In',
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        //loc
        Container(
          margin: EdgeInsets.symmetric(horizontal: 45.w),
          width: widget.width,
          height: 53.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/emailwhite.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: authController.email,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20.sp,
                    letterSpacing: -0.75,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 20.sp,
                      letterSpacing: -0.75,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        //phone
        Container(
          margin: EdgeInsets.symmetric(horizontal: 45.w),
          width: widget.width,
          height: 53.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/pwd.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Obx(
                () => Expanded(
                  child: TextFormField(
                    obscureText: appController.isPasswordHidden.value,
                    controller: authController.password,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(
                      fontSize: 20.sp,
                      letterSpacing: -0.75,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 20.sp,
                        letterSpacing: -0.75,
                        color: Colors.grey.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Container(
                  width: 50.w,
                  height: 50.w,
                  child: IconButton(
                    icon: appController.isPasswordHidden.value
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    color: Colors.grey.shade400,
                    onPressed: () {
                      appController.changePasswordVisibillity();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        //phone
        SizedBox(
          height: 40.h,
        ),
        Container(
          height: 55.h,
          margin: EdgeInsets.symmetric(horizontal: 35.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: buttonColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(1, 1),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50.r),
              onTap: () {
                authController.signIn();
              },
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: const BoxDecoration(),
                child: Center(
                  child: AutoSizeText(
                    "Sign In",
                    maxLines: 1,
                    style: TextStyle(
                      color: buttonText,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          height: 55.h,
          margin: EdgeInsets.symmetric(horizontal: 35.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: buttonColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(1, 1),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50.r),
              onTap: () {
                appController.changeDisplayedAuthWidget();
              },
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: const BoxDecoration(),
                child: Center(
                  child: AutoSizeText(
                    "Sign Up",
                    maxLines: 1,
                    style: TextStyle(
                      color: buttonText,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
