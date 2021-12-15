// ignore_for_file: avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreFurniture extends StatelessWidget {
  const MoreFurniture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 30.w,
          ),
          Container(
            child: AutoSizeText(
              'More furniture',
              maxLines: 1,
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.w700,
                color: nakedText,
                letterSpacing: -0.6,
                shadows: [
                  Shadow(
                    color: nakedText,
                    offset: const Offset(0.14, 0.14),
                  ),
                  Shadow(
                    color: nakedText,
                    offset: const Offset(-0.14, -0.14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
