import 'package:flutter/material.dart';

class ProductState with ChangeNotifier {
  int _quantity = 0;
  int _stock = 10;

  int get stock => _stock;
  set stock(int value) {
    _stock = value;
    notifyListeners();
  }

  int get quantity => _quantity;
  set quantity(int newQuantity) {
    _quantity = newQuantity;
    notifyListeners();
  }
}
