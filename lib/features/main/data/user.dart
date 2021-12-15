// ignore_for_file: constant_identifier_names, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";

  String? id;
  String? name;
  String? email;

  UserModel({this.id, this.name, this.email});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.get(ID);
    name = snapshot.get(NAME);
    email = snapshot.get(EMAIL);
  }

  @override
  List<Object?> get props => [id, name, email];
}
