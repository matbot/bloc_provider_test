import 'package:flutter/material.dart';

class Bloc with ChangeNotifier {
  Map<int,int> _cart = {};
  Map<int,int> get cart => _cart;

  void addItemToCart(index) {
    if(_cart.containsKey(index)) {
      _cart[index]++;
    } else {
      _cart[index] = 1;
    }
    notifyListeners();
  }

  void removeItemFromCart(index) {
    if(_cart.containsKey(index)) {
      _cart.remove(index);
      notifyListeners();
    }
  }
}