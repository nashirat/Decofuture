// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:decofuture2/features/main/data/cart_item.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<CartItem> cartItem;

  const Cart({this.cartItem = const <CartItem>[]});

  @override
  List<Object?> get props => [cartItem];

  int get subtotal =>
      cartItem.fold(0, (total, current) => total + current.price!);

  String get subtotalString => subtotal.toString();
}
