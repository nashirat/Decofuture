// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:auto_size_text/auto_size_text.dart';
import 'package:decofuture2/features/main/presentation/controller/app_controller.dart';
import 'package:decofuture2/features/main/presentation/widgets/auth_widgets/signin_widget.dart';
import 'package:decofuture2/features/main/presentation/widgets/auth_widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50.w,
                      ),
                      Container(
                        width: 38.w,
                        height: 38.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/newlogo.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      AutoSizeText(
                        'Decofuture.',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w700,
                          fontSize: 28.sp,
                          letterSpacing: -0.8,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/artwork.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: width,
                  height: height - 315.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0, -1),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Visibility(
                        visible: appController.isLoginWidgetDisplayed.value,
                        child: SignUpWidget(width: width),
                      ),
                      Visibility(
                        visible: !appController.isLoginWidgetDisplayed.value,
                        child: SignInWidget(width: width),
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
