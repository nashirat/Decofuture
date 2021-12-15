// ignore_for_file: avoid_unnecessary_containersimport 'package:animations/animations.dart';, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:decofuture2/app_state.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/core/constants/controllers.dart';
import 'package:decofuture2/features/main/presentation/pages/cart_page.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/catalog/scroll_views/finished_scroll_view.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/catalog/scroll_views/loading_scroll_view.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/drawer/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController todoController = TextEditingController();
  final bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: const NavigationDrawer(),
        body: Builder(
          builder: (context) => Container(
            width: width,
            height: height,
            color: Colors.white,
            child: Stack(
              children: [
                //Camera(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.grey.shade300.withAlpha(70),
                          Colors.white.withAlpha(254),
                        ],
                        begin: const Alignment(-0.35, 0.07),
                        end: const Alignment(0, 1),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 30.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Container(
                                  height: 30.w,
                                  width: 30.w,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/icons/menu.png'),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 30.w,
                                width: 30.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/newlogo.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Container(
                                child: AutoSizeText(
                                  'Decofuture.',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.sp,
                                    letterSpacing: -0.7,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Bounceable(
                                onTap: () {},
                                onTapUp: (_) {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type:
                                          PageTransitionType.rightToLeftJoined,
                                      child: const CartPage(),
                                      childCurrent: widget,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      reverseDuration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  );
                                },
                                duration: const Duration(milliseconds: 100),
                                scaleFactor: 0.7,
                                child: Obx(
                                  () => Badge(
                                    showBadge:
                                        authController.cartItemList.isNotEmpty
                                            ? true
                                            : false,
                                    toAnimate: false,
                                    position: BadgePosition.topEnd(
                                        top: -12.h, end: -6.w),
                                    padding: EdgeInsets.only(
                                      top: 7.w,
                                      left: 7.w,
                                      right: 7.w,
                                      bottom: 9.w,
                                    ),
                                    badgeColor: buttonColor,
                                    badgeContent: AutoSizeText(
                                      authController.cartItemList.length
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: buttonText,
                                      ),
                                    ),
                                    child: Container(
                                      width: 28.w,
                                      height: 28.w,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/bag.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          width: width,
                          height: 60.h,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30.w,
                              ),
                              Expanded(
                                child: Container(
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    color: greyFill,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Container(
                                        width: 17.w,
                                        height: 17.w,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/icons/srch.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: TextFormField(
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Search",
                                              hintStyle: TextStyle(
                                                fontSize: 20.sp,
                                                letterSpacing: -0.75,
                                                color: greyText,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Container(
                                width: 60.h,
                                height: 60.h,
                                padding: EdgeInsets.all(18.w),
                                decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/icons/scan.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        _isLoading
                            ? Expanded(
                                child: LoadingScrollView(width: width),
                              )
                            : Expanded(
                                child: FinishedScrollView(
                                    widget: widget, width: width),
                              ),
                        // Expanded(
                        //   child: LoadingScrollView(width: width),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
