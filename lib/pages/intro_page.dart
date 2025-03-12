import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/button.dart';

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
            //shop name
            Text(
              "SushiRush",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/sushi.png'),
            ),
            const SizedBox(height: 25),
            Text(
              "The Taste Of Japanese Food",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(" Experience the perfect blend of tradition and convenience, delivered with care.",
            style: TextStyle(
              color: Colors.grey,
              height: 2,
              fontSize: 15
            ),
            ),
            const SizedBox(height: 25),
            MyButton(text: "Get Started",
            onTap: (){
              Navigator.pushNamed(context, '/menupage');
            },)
          ],
        ),
      ),
    );
  }
}
