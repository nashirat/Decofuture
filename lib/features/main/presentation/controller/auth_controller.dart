import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decofuture2/core/constants/colors.dart';
import 'package:decofuture2/core/constants/firebase.dart';
import 'package:decofuture2/features/main/data/cart_item.dart';
import 'package:decofuture2/features/main/data/checkout_item.dart';
import 'package:decofuture2/features/main/data/models.dart';
import 'package:decofuture2/features/main/data/user.dart';
import 'package:decofuture2/features/main/presentation/controller/helpers/show_loading.dart';
import 'package:decofuture2/features/main/presentation/pages/auth_page.dart';
import 'package:decofuture2/features/main/presentation/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  Rx<UserModel> userModel = UserModel().obs;
  RxBool isloggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  RxList<CartItem> cartItemList = RxList<CartItem>();
  RxList<CheckoutItem> checkoutItemList = RxList<CheckoutItem>();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(
      firebaseUser,
      _setInitialScreen,
    );
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => AuthPage());
    } else {
      userModel.bindStream(listenToUser());
      cartItemList.bindStream(getAllCartItems(user.uid));
      checkoutItemList.bindStream(getAllCheckoutItems(user.uid));
      Get.offAll(() => const HomePage());
    }
  }

  Stream<List<CheckoutItem>> getAllCheckoutItems(String _uid) =>
      firebaseFirestore
          .collection("users")
          .doc(_uid)
          .collection("cart")
          .where('uid', isEqualTo: _uid)
          .where(
            'toCheckout',
            isEqualTo: true,
          )
          .snapshots()
          .map((QuerySnapshot query) {
        List<CheckoutItem> cartList = [];
        for (var element in query.docs) {
          cartList.add(CheckoutItem.fromSnapshot(element));
        }
        return cartList;
      });

  Stream<List<CartItem>> getAllCartItems(String _uid) => firebaseFirestore
          .collection("users")
          .doc(_uid)
          .collection("cart")
          .where('uid', isEqualTo: _uid)
          .orderBy('timestamp')
          .snapshots()
          .map((QuerySnapshot query) {
        List<CartItem> cartList = [];
        for (var element in query.docs) {
          cartList.add(CartItem.fromSnapshot(element));
        }
        return cartList;
      });

  RxInt get subtotal =>
      checkoutItemList.fold(0.obs, (total, current) => total + current.cost!);

  Future<void> updateCheckOut(bool newVal, String uid, String cartId) async {
    try {
      firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(cartId)
          .update({
        "toCheckout": newVal,
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> increaseItem(
    int newVal,
    String uid,
    String cartId,
    int newCostVal,
  ) async {
    try {
      firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(cartId)
          .update({
        "quantity": newVal,
        "cost": newCostVal,
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> removeItem(
    String uid,
    String cartId,
  ) async {
    firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(cartId)
        .delete();
  }

  Future<void> decreaseItem(
    int newVal,
    String uid,
    String cartId,
    int newCostVal,
    int quantity,
  ) async {
    try {
      if (quantity > 1) {
        firebaseFirestore
            .collection('users')
            .doc(uid)
            .collection('cart')
            .doc(cartId)
            .update({
          "quantity": newVal,
          "cost": newCostVal,
        });
      } else if (quantity == 1) {
        firebaseFirestore
            .collection('users')
            .doc(uid)
            .collection('cart')
            .doc(cartId)
            .update({
          "quantity": 1,
        });
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> updateCost(int newVal, String uid, String cartId) async {
    try {
      firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(cartId)
          .update({
        "cost": newVal,
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _initializeUserModel(_userId);
        _clearControllers();
        cartItemList.bindStream(getAllCartItems(_userId));
        checkoutItemList.bindStream(getAllCheckoutItems(_userId));
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign in failed", e.toString());
    }
  }

  void signUp() async {
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then(
        (result) {
          String _userId = result.user!.uid;
          _addUserToFirestore(_userId);
          _initializeUserModel(_userId);
          _clearControllers();
          cartItemList.bindStream(getAllCartItems(_userId));
          checkoutItemList.bindStream(getAllCheckoutItems(_userId));
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign in failed", e.toString());
    }
  }

  void signOut() async {
    auth.signOut();
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "id": userId,
      "email": email.text.trim(),
      "name": name.text.trim(),
    });
  }

  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  updateUserData(Map<String, dynamic> data) {
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value!.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));

  addTodo(String content, String uid) async {
    try {
      await firebaseFirestore
          .collection(usersCollection)
          .doc(uid)
          .collection('todos')
          .add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  void addToCart(String id, String name, String img, String seller, int price,
      int quantity, String uid, bool toCheckout, Product product) async {
    try {
      showLoading();
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar(
          "Item is already added",
          "${product.name} is already added, check your cart!",
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: buttonColor,
          borderRadius: 0,
          titleText: AutoSizeText(
            'Item is already added',
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: -0.75,
            ),
          ),
          messageText: AutoSizeText(
            "${product.name} is already added, check your cart!",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              letterSpacing: -0.6,
            ),
          ),
        );
      } else {
        await firebaseFirestore
            .collection(usersCollection)
            .doc(uid)
            .collection('cart')
            .add({
          'id': id,
          'name': name,
          'img': img,
          'seller': seller,
          'price': price,
          'quantity': quantity,
          'uid': uid,
          'cost': price * quantity,
          'toCheckout': toCheckout,
          'timestamp': Timestamp.now(),
        });
        dismissLoadingWidget();
        Get.snackbar(
          "Succesfully added to cart",
          "Succesfully added ${product.name} to cart",
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: buttonColor,
          borderRadius: 0,
          titleText: AutoSizeText(
            'Added to cart',
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: -0.75,
            ),
          ),
          messageText: AutoSizeText(
            "Succesfully added ${product.name} to cart",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              letterSpacing: -0.6,
            ),
          ),
        );
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  bool _isItemAlreadyAdded(Product product) =>
      cartItemList.where((item) => item.productId == product.id).isNotEmpty;
}
