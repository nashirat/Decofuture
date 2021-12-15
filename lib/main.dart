// @dart=2.9

import 'package:decofuture2/core/constants/firebase.dart';
import 'package:decofuture2/features/main/presentation/controller/app_controller.dart';
import 'package:decofuture2/features/main/presentation/controller/auth_controller.dart';
import 'package:decofuture2/features/main/presentation/controller/product_controller.dart';
import 'package:decofuture2/features/main/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'features/main/presentation/widgets/misc_widgets/dissmiss_keyboard.dart';
import 'features/main/presentation/widgets/misc_widgets/no_glow_on_scroll.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AppController());
    Get.put(AuthController());
    Get.put(ProductsController());
  });
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => DismissKeyboard(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Decofuture',
          scrollBehavior: NoGlow(),
          themeMode: ThemeMode.light,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Muli',
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
