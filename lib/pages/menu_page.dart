import 'package:flutter/material.dart';
import 'package:pizzapp/components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzapp/models/shop.dart';
import 'package:pizzapp/pages/pizza_details_page.dart';
import 'package:pizzapp/theme/colors.dart';
import 'package:pizzapp/components/food_tile.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToPizzaDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    //navigation details pizza

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PizzaDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[900],
          elevation: 0,
          leading: const Icon(
            Icons.menu,
          ),
          title: const Text(
            'Montpellier',
          ),
          actions: [
            //boutton panier
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //banniere de promo
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //message de promo
                    Text(
                      'Reduction de 20%',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    //boutton pour obtenir la reduc
                    MyButton(
                      text: "Ajouter",
                      onTap: () {},
                    ),
                  ],
                ),

                //image
                Image.asset(
                  'lib/images/boite.png',
                  height: 100,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          //input de recherche
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Recherche...",
              ),
            ),
          ),
          const SizedBox(height: 25),
          //menu liste
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Nos Pizzas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //article populaire
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToPizzaDetails(index),
              ),
            ),
          ),
          const SizedBox(height: 25),
          //supplement

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'lib/images/cheese.png',
                  height: 60,
                ),

                const SizedBox(width: 20),

                //nom et prix
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //nom
                  Text(
                    "Cheddar",
                    style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  //prix

                  Text(
                    '\2.00€',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ]),
                //note favorie
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          ),
        ]));
  }
}
