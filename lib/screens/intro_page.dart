import 'package:flutter/material.dart';
import 'package:specialdesire/constants/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Brand logo
              Image.asset(
                'assets/logo.png',
                width: 220,
              ),
              Column(
                children: [
                  Text(
                    'Special Desire TN',
                    style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  // Brand description
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Elevate Your Wardrobe with Our Premium Collection of T-Shirts and Hoodies, Featuring Irresistible Promotions and Uncompromising Quality for Every Occasion 😍',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: primaryColor.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
              // Brand name

              // Enter button
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: bgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () => Navigator.pushNamed(context, '/shop_page'),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SHOP NOW',
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 20,
                              color: bgColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: bgColor,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
