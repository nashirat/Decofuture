// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:decofuture2/features/main/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TwoDView extends StatefulWidget {
  const TwoDView({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  _TwoDViewState createState() => _TwoDViewState();
}

class _TwoDViewState extends State<TwoDView> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 45.h,
            left: -20.w,
            child: Container(
              height: 310.h,
              width: width,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 330.h,
                  scrollDirection: Axis.vertical,
                  viewportFraction: 1,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 300),
                  autoPlayInterval: const Duration(milliseconds: 6250),
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                itemCount: 4,
                itemBuilder: (context, index, realIndex) {
                  return buildImage(index);
                },
              ),
            ),
          ),
          Positioned(
            top: 175.h,
            left: 25.w,
            child: buildIndicator(),
          ),
        ],
      ),
    );
  }

  Widget buildImage(int index) {
    final List imgList = [
      widget.product.imgr!,
      widget.product.imgf!,
      widget.product.imgl!,
      widget.product.imgb!
    ];
    return Container(
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(imgList[index]),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        axisDirection: Axis.vertical,
        activeIndex: activeIndex,
        count: 4,
        duration: const Duration(milliseconds: 300),
        effect: ExpandingDotsEffect(
          expansionFactor: 2.5,
          radius: 7.r,
          dotWidth: 7.w,
          dotHeight: 7.h,
          spacing: 6.w,
          activeDotColor: Colors.grey.shade500.withOpacity(0.8),
          dotColor: Colors.grey.withOpacity(0.4),
        ),
      );
}
