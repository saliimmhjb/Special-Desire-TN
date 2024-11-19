import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/cart_datas.dart';
import 'package:specialdesire/screens/cart_screen.dart';
import 'package:specialdesire/screens/credits_screen.dart';
import 'package:specialdesire/screens/favorite_screen.dart';
import 'package:specialdesire/screens/hoodies_screen.dart';
import 'package:specialdesire/screens/intro_page.dart';
import 'package:specialdesire/screens/shop_page.dart';
import 'package:specialdesire/screens/tshirts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          fontFamily: GoogleFonts.roboto().fontFamily,
          textTheme: GoogleFonts.robotoTextTheme(),
          scaffoldBackgroundColor: bgColor,
        ),
        routes: {
          '/intro_page': (BuildContext context) => IntroPage(),
          '/shop_page': (BuildContext context) => ShopPage(),
          '/cart_page': (BuildContext context) => CartScreen(),
          '/favorites_page': (BuildContext context) => FavoriteList(),
          '/tshirts_page': (BuildContext context) => TShirtScreen(),
          '/hoodies_page': (BuildContext context) => HoodiesScreen(),
          '/credits_page': (BuildContext context) => CreditsScreen(),
        },
        home: const IntroPage(),
      ),
    );
  }
}
