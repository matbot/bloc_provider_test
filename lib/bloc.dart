import 'package:flutter/material.dart';

class Bloc with ChangeNotifier {
  Map<int,int> _cart = {};
  Map<int,int> get cart => _cart;

  void addItemToCart(index) {
    _cart[index]++;
    notifyListeners();
  }

  void removeItemFromCart(index) {
    if(_cart.containsKey(index)) {
      _cart.remove(index);
      notifyListeners();
    }
  }
}