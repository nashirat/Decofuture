// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/features/main/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_viewer/model_viewer.dart';

class ThreeDView extends StatefulWidget {
  const ThreeDView({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  _ThreeDViewState createState() => _ThreeDViewState();
}

class _ThreeDViewState extends State<ThreeDView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(17.w),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.r),
          topRight: Radius.circular(22.r),
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
        child: ModelViewer(
          src: widget.product.modelLink,
          alt: widget.product.name,
          ar: false,
          autoRotate: true,
          cameraControls: true,
          backgroundColor: greyFill,
        ),
      ),
    );
  }
}
