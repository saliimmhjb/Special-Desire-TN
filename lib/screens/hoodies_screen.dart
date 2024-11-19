import 'package:flutter/material.dart';
import 'package:specialdesire/components/basic/item_tile.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/products_datas.dart';

class HoodiesScreen extends StatelessWidget {
  const HoodiesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 27,
          ),
        ),
        title: Text(
          'Hoodies',
          style: Theme.of(context).textTheme.overline!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 20, color: primaryColor),
        ),
        backgroundColor: bgColor,
        centerTitle: true,
        toolbarHeight: 72,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ...shopProducts
              .where((product) => product.productType == 'Hoodie')
              .map(
                (tshirt) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: ItemTile(categoryProduct: tshirt),
            ),
          )
              .toList(),
        ],
      ),
    );
  }
}
