import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:specialdesire/components/basic/favorite_tile.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/cart_datas.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

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
          'MY FAVORITES',
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
          ...context.watch<Cart>().favoritesItems.map((e) => Padding(
            padding: const EdgeInsets.all(15.0),
            child: FavoriteTile(favoriteItem: e),
          ))
        ],
      ),
    );
  }
}
