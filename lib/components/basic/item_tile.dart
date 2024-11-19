import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/cart_datas.dart';
import 'package:specialdesire/models/product_model.dart';

class ItemTile extends StatelessWidget {
  final Product categoryProduct;

  const ItemTile({super.key, required this.categoryProduct});

  void addItemToCartOperation(Product item, BuildContext context) {
    context.read<Cart>().addItemToCart(item);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${item.productName} has been added to your cart!')));
  }

  @override
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
              child: Image.asset(categoryProduct.productImage),
            ),
            SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryProduct.productName.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 21,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  categoryProduct.productOversize
                      ? 'Oversized ${categoryProduct.productType}'
                      : 'Standard ${categoryProduct.productType}',
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 17,
                        color: primaryColor.withOpacity(0.8),
                      ),
                ),
                Row(
                  children: [
                    Text(
                      '${categoryProduct.productOldPrice}DT',
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 15,
                            color: primaryColor.withOpacity(0.6),
                        decoration: TextDecoration.lineThrough,
                          ),
                    ),
                    SizedBox(width: 6,),
                    Text(
                      '${categoryProduct.productPrice}DT',
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 17,
                            color: primaryColor.withOpacity(0.9),
                          ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () => addItemToCartOperation(categoryProduct, context),
          child: Icon(
            Icons.add_box_outlined,
            color: primaryColor,
            size: 32,
          ),
        )
      ],
    );
  }
}
