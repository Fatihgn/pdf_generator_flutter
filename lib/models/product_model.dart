import 'package:flutter/material.dart';

class ProductModel {
  String name;
  double amount;
  double price;
  double total;
  double kdv;

  ProductModel(
      {required this.name,
      required this.amount,
      required this.price,
      required this.total,
      required this.kdv});

  String getIndex(int index) {
    switch (index) {
      case 0:
        return name;
      case 1:
        return amount.toString();
      case 2:
        return price.toString();
      case 3:
        return total.toString();
    }
    return '';
  }
}
