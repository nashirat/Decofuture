import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decofuture2/core/constants/firebase.dart';
import 'package:decofuture2/features/main/data/models.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController instance = Get.find();
  RxList<Product> products = RxList<Product>();
  String collection = "products";

  @override
  void onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }

  Stream<List<Product>> getAllProducts() => firebaseFirestore
          .collection(collection)
          .snapshots()
          .map((QuerySnapshot query) {
        List<Product> prodList = [];
        for (var element in query.docs) {
          prodList.add(Product.fromSnapshot(element));
        }
        return prodList;
      });
}
