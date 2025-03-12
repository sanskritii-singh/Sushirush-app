import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/button.dart';
import 'package:myapp/models/food.dart';
import 'package:myapp/models/shop.dart';
import 'package:myapp/themes/colors.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount> 0){
        quantityCount--;
      }
    });
  }
  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
      
    });
  }
  void addToCart(){
    if(quantityCount>0){
      final shop=context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);
      showDialog(context: context,
      barrierDismissible: false,
       builder: (context) => AlertDialog(
        backgroundColor: primaryColor,


        content: Text("Succesfully added to Cart",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
            Navigator.pop(context);
          }, icon: Icon(Icons.done,color: Colors.white,))
        ],
        
      ));
  
    }


  }

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "A classic favorite, Salmon Sushi features fresh, buttery salmon delicately placed over perfectly seasoned sushi rice. Each bite melts in your mouth, offering a rich umami taste balanced with a hint of wasabi and soy sauce. Served with pickled ginger for a refreshing contrast, this sushi is a must-try for seafood lovers.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$" + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(quantityCount.toString(),style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:18 ),),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
               const SizedBox(height: 25,),
               MyButton(text: "Add to Cart", onTap: addToCart), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
