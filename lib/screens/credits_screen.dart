import 'package:flutter/material.dart';
import 'package:specialdesire/constants/colors.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  void goBackToHomePage(BuildContext context) {
    Navigator.of(context).popUntil(ModalRoute.withName('/shop_page'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => goBackToHomePage(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 27,
          ),
        ),
        title: Text(
          'CREDITS',
          style: Theme.of(context).textTheme.overline!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 20, color: primaryColor),
        ),
        backgroundColor: bgColor,
        centerTitle: true,
        toolbarHeight: 72,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.warning_amber,
                size: 120,
                color: primaryColor,
              ),
              Text(
                textAlign: TextAlign.center,
                "SPECIAL DESIRE TN is a learning project by developer Mahjoub Salim, offering a simulated shopping experience without payment features. It's designed for educational purposes, allowing users to explore a virtual shopping interface safely.",
                style: Theme.of(context)
                    .textTheme
                    .overline!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: bgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () => Navigator.pushNamed(context, '/intro_page'),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I UNDERSTAND',
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 20,
                              color: bgColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.check_box,
                          color: bgColor,
                          size: 23,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
