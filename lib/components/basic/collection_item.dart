import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/cart_datas.dart';
import 'package:specialdesire/models/product_model.dart';
import 'package:specialdesire/screens/product_screen.dart';

class CollectionItem extends StatefulWidget {
  final Product product;

  const CollectionItem({required this.product});

  @override
  State<CollectionItem> createState() => _CollectionItemState();
}

class _CollectionItemState extends State<CollectionItem> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductScreen(choosenProduct: widget.product),
              ),
            ),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProductScreen(choosenProduct: widget.product),
                ),
              ),
              child: Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                  color: itemBgColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        widget.product.productImage,
                        width: 90,
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: GestureDetector(
                        onTap: () => addItemToFavorite(context, widget.product),
                        child: Icon(
                          favoritesList.contains(widget.product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoritesList.contains(widget.product)
                              ? Colors.redAccent
                              : primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.product.productName,
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '${widget.product.productPrice}DT',
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: primaryColor.withOpacity(0.7),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
