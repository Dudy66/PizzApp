import 'package:flutter/material.dart';
import 'package:pizzapp/components/button.dart';
import 'package:pizzapp/models/food.dart';
import 'package:pizzapp/models/shop.dart';
import 'package:pizzapp/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //supprimer du panier
  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();

    //supprimer du panier
    shop.removeFromCart(food);
  }

  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("Mon panier"),
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: Column(children: [
          //Panier Client
          Expanded(
            child: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context, index) {
                //recuperer le panier
                final Food food = value.cart[index];
                //recuperer le nom
                final String foodName = food.name;
                //recuperer le prix
                final String foodPrix = food.prix;
                //return la liste
                return Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${food.prix}\€",
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () => removeFromCart(food, context),
                      )),
                );
              },
            ),
          ),
          //PAY BUTTON
          GestureDetector(
            onTap: payNow,
            child: Container(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Regler la commande",
                onTap: () {},
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
