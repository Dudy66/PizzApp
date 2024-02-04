import 'package:flutter/material.dart';
import 'package:pizzapp/components/button.dart';
import 'package:pizzapp/models/shop.dart';
import 'package:pizzapp/theme/colors.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import 'package:google_fonts/google_fonts.dart';

class PizzaDetailsPage extends StatefulWidget {
  final Food food;
  const PizzaDetailsPage({super.key, required this.food});

  @override
  State<PizzaDetailsPage> createState() => _PizzaDetailsPageState();
}

class _PizzaDetailsPageState extends State<PizzaDetailsPage> {
  //quantité
  int quantityCount = 0;

  //moins
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //plus
  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();

      //ajouter
      shop.addToCart(widget.food, quantityCount);

      //message utilisateur
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
            backgroundColor: primaryColor,
            content: const Text(
              "Article ajouter au panier",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            actions: [
              //boutton valider
              IconButton(
                onPressed: () {
                  //pop pour enlever
                  Navigator.pop(context);
                  //pop pour aller a l'ecran d'avant
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              )
            ]),
      );
    }
  }
  //ajouter au panier

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //liste de la vue
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(height: 25),

                  //note
                  Row(
                    children: [
                      // etoile
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(width: 5),
                      //note
                      Text(
                        widget.food.note,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  //nom
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  const SizedBox(height: 10),

                  //description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Base créme fraiche, délicieuse pizza composé d'emmental, mozzarella, chèvre et miel",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //prix + quantite + ajout au panier

          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // prix et quantite
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //prix
                    Text(
                      "\€${widget.food.prix}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    //quantite
                    Row(
                      children: [
                        //boutton moins
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        //compte quantité
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          quantityCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        //boutton plus
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                //ajouter au panier
                MyButton(text: "Ajouter au panier", onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
