// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  String? id;
  String? name;
  String? seller;
  int? price;
  String? userProfile;
  String? detail;
  int? height;
  int? width;
  int? length;
  String? modelLink;
  String? imgr;
  String? imgf;
  String? imgl;
  String? imgb;
  List? category;

  Product({
    this.id,
    this.name,
    this.seller,
    this.price,
    this.userProfile,
    this.detail,
    this.height,
    this.width,
    this.length,
    this.modelLink,
    this.imgr,
    this.imgf,
    this.imgl,
    this.imgb,
    this.category,
  });

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    name = snapshot.get('name');
    seller = snapshot.get('seller');
    price = snapshot.get('price');
    userProfile = snapshot.get('userProfile');
    detail = snapshot.get('detail');
    height = snapshot.get('height');
    width = snapshot.get('width');
    length = snapshot.get('length');
    modelLink = snapshot.get('modelLink');
    imgr = snapshot.get('imgr');
    imgf = snapshot.get('imgf');
    imgl = snapshot.get('imgl');
    imgb = snapshot.get('imgb');
    category = snapshot.get('category');
  }

  @override
  List<Object?> get props => [
        id,
        name,
        seller,
        price,
        userProfile,
        detail,
        modelLink,
        height,
        width,
        length,
        imgr,
        imgf,
        imgl,
        imgb,
        category,
      ];
}
