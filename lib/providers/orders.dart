import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shop/providers/cart.dart';
import '../providers/cart.dart';

class OrdersStructure with ChangeNotifier {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrdersStructure(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrdersStructure> _orders = [];
  List<OrdersStructure> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrdersStructure(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));

    notifyListeners();
  }
}
