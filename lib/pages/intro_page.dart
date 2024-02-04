import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzapp/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            //nom app
            Text(
              "PizzApp",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/pizza.png'),
            ),
            //title
            Text(
              "LES MEILLEURES PIZZAS DE MONTPELLIER",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            //subtitle
            Text(
              "Livraison à domicile",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),

            const SizedBox(height: 25),

            //button
            MyButton(
              text: "Commander dés maintenant",
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
