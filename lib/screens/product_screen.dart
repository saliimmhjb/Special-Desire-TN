import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:specialdesire/components/basic/size_tile.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/cart_datas.dart';
import 'package:specialdesire/models/product_model.dart';
import 'package:specialdesire/screens/cart_screen.dart';

class ProductScreen extends StatefulWidget {
  final Product choosenProduct;

  const ProductScreen({super.key, required this.choosenProduct});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isCartHasSomething = false;
  int itemCount = 0;
  int itemInCart = 0;

  void addItemToCartOperation(Product item, BuildContext context) {
    itemInCart = context.read<Cart>().getItemsCount();
    if (itemInCart < 4) {
      context.read<Cart>().addItemToCart(item);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${item.productName} has been added to your cart!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You can't add more than 4 items in your cart!"),
        ),
      );
    }
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

  @override
  Widget build(BuildContext context) {
    checkIfSomethingInCart(context);
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
          'SPECIAL DESIRE TN',
          style: Theme.of(context).textTheme.overline!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 20, color: primaryColor),
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
                    color: primaryColor,
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
        backgroundColor: bgColor,
        centerTitle: true,
        toolbarHeight: 72,
        elevation: 0,
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(widget.choosenProduct.productImage),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.choosenProduct.productName,
                      style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    Text(
                      widget.choosenProduct.productOversize
                          ? 'Oversized ${widget.choosenProduct.productType}'
                          : 'Standard ${widget.choosenProduct.productType}',
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: primaryColor.withOpacity(0.9),
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${widget.choosenProduct.productOldPrice.toString()}DT',
                      style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          color: primaryColor.withOpacity(0.8)),
                    ),
                    Text(
                      '${widget.choosenProduct.productPrice.toString()}DT',
                      style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.choosenProduct.productDescription,
              style: Theme.of(context).textTheme.overline!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: primaryColor.withOpacity(0.7)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 26,
                ),
                Text(
                  'Available sizes',
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.choosenProduct.availableSizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 0, right: 12),
                          child: SizeTile(
                              size:
                                  widget.choosenProduct.availableSizes[index]),
                        );
                      }),
                ),
                SizedBox(
                  height: 21,
                ),
                ElevatedButton(
                  onPressed: () =>
                      addItemToCartOperation(widget.choosenProduct, context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: bgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ADD TO CART',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
