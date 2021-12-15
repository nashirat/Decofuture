import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutItem {
  String? id;
  String? productId;
  String? image;
  String? seller;
  String? name;
  String? uid;
  int? quantity;
  int? price;
  int? cost;
  bool? toCheckout;

  CheckoutItem({
    this.id,
    this.productId,
    this.image,
    this.seller,
    this.name,
    this.uid,
    this.quantity,
    this.price,
    this.cost,
    this.toCheckout,
  });

  CheckoutItem.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    productId = snapshot.get('id');
    image = snapshot.get('img');
    seller = snapshot.get('seller');
    name = snapshot.get('name');
    uid = snapshot.get('uid');
    quantity = snapshot.get('quantity');
    price = snapshot.get('price');
    cost = snapshot.get('cost');
    toCheckout = snapshot.get('toCheckout');
  }
}
