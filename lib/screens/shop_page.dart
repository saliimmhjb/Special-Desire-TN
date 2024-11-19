import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:specialdesire/components/basic/category_item.dart';
import 'package:specialdesire/components/basic/collection_item.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/cart_datas.dart';
import 'package:specialdesire/data/products_datas.dart';
import 'package:specialdesire/models/product_model.dart';
import 'package:specialdesire/screens/cart_screen.dart';
import 'package:specialdesire/screens/product_screen.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late Product finalRandomProduct;
  bool isCartHasSomething = false;
  int itemCount = 0;

  @override
  void initState() {
    super.initState();
    finalRandomProduct = getRandomProduct();
  }

  Product getRandomProduct() {
    Random random = Random();
    int randomIndex = random.nextInt(shopProducts.length);
    return shopProducts[randomIndex];
  }

  void checkIfSomethingInCart(BuildContext context) {
    itemCount = context.watch<Cart>().getItemsCount();
    if (itemCount == 0) {
      setState(() {
        isCartHasSomething = false;
      });
    } else {
      setState(() {
        isCartHasSomething = true;
      });
    }
  }

  List favoritesList = [];

  void addItemToFavorite(BuildContext context, Product toAddToFavorites) {
    favoritesList = context.read<Cart>().favoritesItems;
    for (int i = 0; i < favoritesList.length; i++) {
      if (toAddToFavorites == favoritesList[i]) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${toAddToFavorites.productName} is already in your favorites!',
            ),
          ),
        );
        return;
      }
    }
    context.read<Cart>().addItemToFavorites(toAddToFavorites);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${toAddToFavorites.productName} has been added to your favorites!',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Product product;
    checkIfSomethingInCart(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/credits_page'),
          child: Icon(
            Icons.contact_support_outlined,
            color: bgColor,
            size: 25,
          ),
        ),
        title: Text(
          'SPECIAL DESIRE TN',
          style: Theme.of(context).textTheme.overline!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 20, color: bgColor),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/cart_page'),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: bgColor,
                    size: 27,
                  ),
                  Visibility(
                    visible: isCartHasSomething,
                    child: Positioned(
                      right: 1,
                      top: 1,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: primaryColor,
        centerTitle: true,
        toolbarHeight: 72,
        elevation: 0,
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Stack(
            children: [],
          ),
          Container(
            height: 140,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CATEGORIES',
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 17,
                          color: bgColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/tshirts_page'),
                            child: CategoryItem(
                              cateogryName: 'T-Shirts',
                              categoryIcon: Icon(
                                FontAwesomeIcons.shirt,
                                color: primaryColor,
                                size: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/hoodies_page'),
                            child: CategoryItem(
                              cateogryName: 'Hoodies',
                              categoryIcon: Icon(
                                FontAwesomeIcons.shirt,
                                color: primaryColor,
                                size: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed('/favorites_page'),
                              child: Icon(
                                Icons.favorite,
                                color: primaryColor,
                                size: 25,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: bgColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'COLLECTIONS',
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: primaryColor,
                        ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 290,
                        decoration: BoxDecoration(
                          color: itemBgColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              finalRandomProduct!.productImage,
                              width: 170,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Text(
                                    finalRandomProduct!.productName,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline!
                                        .copyWith(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      finalRandomProduct!.productDescription,
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .overline!
                                          .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis,
                                            color:
                                                primaryColor.withOpacity(0.7),
                                          ),
                                      maxLines: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () => addItemToFavorite(context, finalRandomProduct),
                                child: Icon(
                                  favoritesList.contains(finalRandomProduct) ? Icons.favorite : Icons.favorite_border,
                                  color: favoritesList.contains(finalRandomProduct) ? Colors.redAccent : primaryColor,
                                ),
                              )),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProductScreen(
                                    choosenProduct: finalRandomProduct),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'SEE MORE!',
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: primaryColor,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Divider(
                    color: primaryColor.withOpacity(0.2),
                    endIndent: 35,
                    indent: 35,
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GridView.count(
                        crossAxisCount: 1,
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...shopProducts.map((e) => CollectionItem(
                                product: e,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
