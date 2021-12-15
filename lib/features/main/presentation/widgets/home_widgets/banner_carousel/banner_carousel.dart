// ignore_for_file: sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';

import 'package:decofuture2/features/main/data/models.dart';
import 'package:decofuture2/features/main/presentation/widgets/home_widgets/banner_carousel/banner_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      color: Colors.transparent,
      child: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 10.w),
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              width: width,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 155.h,
                  // aspectRatio: 16 / 5.4,
                  viewportFraction: 0.9,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 300),
                  autoPlayInterval: const Duration(milliseconds: 4250),
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                itemCount: CustomBanner.cBanners.length,
                itemBuilder: (context, index, realIndex) {
                  return BannerCard(
                      index: index, cBanner: CustomBanner.cBanners[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
