import 'dart:core';

import 'package:flutter/material.dart';

import 'food.dart';
class Shop extends ChangeNotifier {
  final List<Food>_foodMenu= [
    Food(
      name: "Salmon Sushi",
      price: "21.00",
      imagePath: "lib/images/sushi (2).png",
      rating: "4.9",
    ),
    Food(
      name: "Tuna",
      price: "20.00",
      imagePath: "lib/images/sushi (3).png",
      rating: "4.7",
    ),
  ];
  List<Food> _cart= [];
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  void addToCart(Food foodItem, int quantity){
    for(int i=0;i<quantity;i++){
      _cart.add(foodItem);
    }
    print("Cart now contains: ${_cart.map((item) => item.name).toList()}");
    notifyListeners();
  }
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
  
}