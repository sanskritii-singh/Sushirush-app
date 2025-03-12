import 'package:flutter/material.dart';
import 'package:myapp/components/button.dart';
import 'package:myapp/models/food.dart';
import 'package:myapp/models/shop.dart';
import 'package:myapp/themes/colors.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food,BuildContext context){
    final shop=context.read<Shop>();
    shop.removeFromCart(food);


  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context,value,child) => Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("My Cart"),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Expanded(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount: value.cart.length, itemBuilder:(context,index){
                final Food food = value.cart[index];
                final String foodName=food.name;
                final String foodPrice =food.price;
                return Container(
                  decoration: BoxDecoration(color: secondaryColor,borderRadius: BorderRadius.circular(8)),
                  margin:EdgeInsets.only(left: 20,top:20,right: 20) ,
                  child: ListTile(
                    title: Text(foodName,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    subtitle: Text(foodPrice,style: TextStyle(color: Colors.white),),
                    trailing: IconButton(onPressed: () => removeFromCart(food,context), icon: Icon(Icons.delete,color: Colors.grey[300],)),
                  ),
                );
                
                
                
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: "Pay now", onTap: (){}),
            )
          ],
        ),
      ),
    ),
    );
  }
}