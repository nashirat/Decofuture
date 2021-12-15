import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  RxBool isLoginWidgetDisplayed = true.obs;
  RxBool isPasswordHidden = true.obs;
  RxInt selectedCategoryId = 0.obs;

  changeDisplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }

  changePasswordVisibillity() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  updateCategoryId(RxInt selectedCategoryId) {
    this.selectedCategoryId = selectedCategoryId;
  }
}
