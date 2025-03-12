import 'package:flutter/material.dart';
import 'package:myapp/models/shop.dart';
import 'package:myapp/pages/cart_page.dart';
import 'package:myapp/pages/intro_page.dart';
import 'package:myapp/pages/menu_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) =>Shop(),
    child:const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage':(context) => const IntroPage(),
        '/menupage':(context) => const MenuPage(),
        '/cartpage':(context) => const CartPage(),
      },
    );
  }
}