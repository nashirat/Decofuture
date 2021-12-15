// ignore_for_file: avoid_unnecessary_containers

import 'package:decofuture2/features/main/data/product.dart';
import 'package:decofuture2/features/main/presentation/widgets/product_widgets/product_description.dart';
import 'package:decofuture2/features/main/presentation/widgets/product_widgets/product_measurement.dart';
import 'package:decofuture2/features/main/presentation/widgets/product_widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: width,
        height: height - 375.h,
        color: Colors.white,
        child: Column(
          children: [
            ProductTitle(width: width, product: product),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ProductDescription(width: width, product: product),
                    ProductMeasurement(width: width, product: product),
                    SizedBox(
                      height: 150.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
