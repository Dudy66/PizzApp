import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    //pizza1
    Food(
        name: "Chevrette",
        prix: "19.0",
        imagePath: "lib/images/pizza2.png",
        note: "4,8"),
    //pizza2
    Food(
        name: "Canibal",
        prix: "25.0",
        imagePath: "lib/images/pizza3.png",
        note: "5,0"),

    //pizza3
    Food(
        name: "Jambon",
        prix: "15.0",
        imagePath: "lib/images/pizza4.png",
        note: "4,2"),

    //pizza4
    Food(
        name: "Champignon",
        prix: "10.0",
        imagePath: "lib/images/pizza5.png",
        note: "3,0"),
  ];

  //panier user
  List<Food> _cart = [];

  //mettre en place les methoodes
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //ajouter au panier
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //suprimer du panier
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
