import 'package:cached_network_image/cached_network_image.dart';
import 'package:decofuture2/features/main/data/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
    required this.index,
    required this.cBanner,
  }) : super(key: key);

  final int index;
  final CustomBanner cBanner;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(right: 23.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(cBanner.imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
      );
}
