import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/cart_datas.dart';
import 'package:specialdesire/models/product_model.dart';

class FavoriteTile extends StatefulWidget {
  final Product favoriteItem;

  const FavoriteTile({super.key, required this.favoriteItem});

  @override
  State<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  @override
  void deleteItemFromFavorites(
      BuildContext context, Product itemToRemoveFromFavorite) {
    context.read<Cart>().removeItemFromFavorites(itemToRemoveFromFavorite);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            '${itemToRemoveFromFavorite.productName} has been removed from your favorites!'),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: itemBgColor,
              ),
              child: Image.asset(widget.favoriteItem.productImage),
            ),
            SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.favoriteItem.productName.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 21,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  widget.favoriteItem.productOversize
                      ? 'Oversized ${widget.favoriteItem.productType}'
                      : 'Standard ${widget.favoriteItem.productType}',
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 17,
                        color: primaryColor.withOpacity(0.8),
                      ),
                ),
                Text(
                  '${widget.favoriteItem.productPrice}DT',
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 17,
                        color: primaryColor.withOpacity(0.8),
                      ),
                )
              ],
            ),
          ],
        ),
        GestureDetector(
            onTap: () => deleteItemFromFavorites(context, widget.favoriteItem),
            child: Icon(
              Icons.favorite,
              color: Colors.redAccent,
              size: 32,
            ))
      ],
    );
  }
}
