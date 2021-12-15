// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/core/constants/controllers.dart';
import 'package:decofuture2/features/main/data/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.cartItem,
    required this.uid,
    required this.animation,
    this.onClicked,
  }) : super(key: key);

  final String uid;
  final CartItem cartItem;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      key: ValueKey(cartItem.id),
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOutCirc),
      ),
      child: Container(
        key: ValueKey(cartItem.id),
        margin: EdgeInsets.symmetric(vertical: 6.h),
        width: MediaQuery.of(context).size.width,
        height: 100.h,
        color: Colors.white,
        child: Stack(
          children: [
            Row(
              children: [
                Bounceable(
                  onTap: () {
                    authController.updateCheckOut(
                      !cartItem.toCheckout!,
                      uid,
                      cartItem.id!,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.5.w),
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color: cartItem.toCheckout!
                            ? brown.withOpacity(0.55)
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Opacity(
                        opacity: cartItem.toCheckout! ? 1 : 0,
                        child: Container(
                          width: 26.w,
                          height: 26.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/check.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: Opacity(
                    opacity: cartItem.toCheckout! ? 1 : 0.43,
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.h,
                            decoration: BoxDecoration(
                              color: greyFill,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Container(
                              key: ValueKey(cartItem.image),
                              margin: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      cartItem.image!),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.h, vertical: 14.h),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: AutoSizeText(
                                            cartItem.name!,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 21.sp,
                                              color: nakedText,
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: AutoSizeText(
                                            cartItem.seller!,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: greyText,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: AutoSizeText(
                                            NumberFormat.simpleCurrency(
                                                    locale: 'id_ID',
                                                    decimalDigits: 0)
                                                .format(cartItem.quantity! *
                                                    cartItem.price!),
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: nakedText.withOpacity(0.8),
                                              letterSpacing: -0.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, bottom: 12.h, right: 4.w),
                  child: Opacity(
                    opacity: cartItem.toCheckout! ? 1 : 0.43,
                    child: Container(
                      height: double.infinity,
                      width: 36.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Spacer(),
                          Bounceable(
                            onTap: () {
                              authController.increaseItem(
                                cartItem.quantity! + 1,
                                uid,
                                cartItem.id!,
                                cartItem.cost! + cartItem.price!,
                              );
                            },
                            child: Container(
                              color: Colors.transparent,
                              width: 26.w,
                              height: 26.w,
                              child: Icon(
                                Icons.add,
                                size: 18.sp,
                                color: nakedText.withOpacity(0.6),
                              ),
                            ),
                          ),
                          Container(
                            child: AutoSizeText(
                              cartItem.quantity.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: nakedText,
                              ),
                            ),
                          ),
                          Bounceable(
                            onTap: () {
                              authController.decreaseItem(
                                cartItem.quantity! - 1,
                                uid,
                                cartItem.id!,
                                cartItem.cost! - cartItem.price!,
                                cartItem.quantity!,
                              );
                            },
                            child: Container(
                              color: Colors.transparent,
                              width: 26.w,
                              height: 26.w,
                              child: Icon(
                                Icons.remove,
                                size: 18.sp,
                                color: nakedText.withOpacity(0.6),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 110.w,
              child: Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, 1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: onClicked,
                  icon: const ImageIcon(
                    AssetImage('assets/icons/delete.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
