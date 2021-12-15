import 'package:decofuture2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

showLoading() {
  Get.dialog(customDialog());
}

customDialog() {
  return Container(
    color: Colors.transparent,
    child: Center(
      child: SpinKitChasingDots(
        color: buttonText,
      ),
    ),
  );
}

dismissLoadingWidget() {
  Get.back();
}
