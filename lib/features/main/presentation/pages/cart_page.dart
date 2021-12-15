// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:auto_size_text/auto_size_text.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/core/constants/controllers.dart';
import 'package:decofuture2/features/main/data/cart_item.dart';
import 'package:decofuture2/features/main/presentation/controller/auth_controller.dart';
import 'package:decofuture2/features/main/presentation/widgets/cart_widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> items = List.from(authController.cartItemList);
  final listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      GestureDetector(
                        onTapUp: (_) {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 24.w,
                          width: 24.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/back.png'),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 4.w,
                      ),
                      Container(
                        child: AutoSizeText(
                          'Cart',
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.w700,
                            fontSize: 28.sp,
                            letterSpacing: -0.7,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 58.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: AnimatedList(
                      key: listKey,
                      initialItemCount: items.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index, animation) => Obx(
                        () => CartItemCard(
                          key: ValueKey(
                              authController.cartItemList[index].image),
                          cartItem: authController.cartItemList[index],
                          uid: authController.userModel.value.id!,
                          animation: animation,
                          onClicked: () => removeItem(index),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                child: Container(
                  padding: EdgeInsets.only(bottom: 4.h),
                  width: MediaQuery.of(context).size.width,
                  height: 65.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50.w,
                      ),
                      GetX<AuthController>(
                          init: Get.put<AuthController>(AuthController()),
                          builder: (AuthController authController) {
                            return Container(
                              child: AutoSizeText(
                                NumberFormat.simpleCurrency(
                                        locale: 'id_ID', decimalDigits: 0)
                                    .format(authController.subtotal.toInt()),
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }),
                      const Spacer(),
                      Container(
                        child: AutoSizeText(
                          '-',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: buttonText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        child: AutoSizeText(
                          'Checkout',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: buttonText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void removeItem(int index) {
    final removedItem = items[index];

    items.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => CartItemCard(
        uid: authController.userModel.value.id!,
        cartItem: removedItem,
        animation: animation,
        onClicked: () {},
      ),
      duration: Duration(milliseconds: 300),
    );

    authController.removeItem(
        authController.userModel.value.id!, removedItem.id!);
  }
}
