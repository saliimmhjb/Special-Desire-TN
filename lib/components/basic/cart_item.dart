import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/cart_datas.dart';
import 'package:specialdesire/models/product_model.dart';

class CardItem extends StatefulWidget {
  final Product cartProduct;

  const CardItem({super.key, required this.cartProduct});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  void removeFromCart() {
    setState(
      () {
        context.read<Cart>().removeItemFromCart(widget.cartProduct);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                '${widget.cartProduct.productName} has been removed from your cart!'),
          ),
        );
      },
    );
  }

  int itemQuantity = 1;
  String availableSizes = 'L';
  int currentIndex = 0;

  void addItemQuantity(bool increase) {
    if (increase == true) {
      if (itemQuantity < 6) {
        setState(() {
          itemQuantity++;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('You can purchase a maximum of six of this item!')));
      }
    } else {
      if (itemQuantity > 1) {
        setState(() {
          itemQuantity--;
        });
      }
    }
  }

  void changeAvailableSizes() {
    if (currentIndex < widget.cartProduct.availableSizes.length) {
      setState(() {
        availableSizes = widget.cartProduct.availableSizes[currentIndex];
        currentIndex++;
      });
    } else {
      setState(() {
        currentIndex = 0;
        availableSizes = widget.cartProduct.availableSizes[currentIndex];
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                color: itemBgColor, borderRadius: BorderRadius.circular(15)),
            child: Image.asset(widget.cartProduct.productImage),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.cartProduct.productName,
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: 65,
                  ),
                  GestureDetector(
                    onTap: removeFromCart,
                    child:
                        Icon(Icons.close, color: primaryColor.withOpacity(0.8)),
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: itemBgColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 74,
                          child: Text(
                            'SIZE: ${availableSizes}',
                            style: Theme.of(context)
                                .textTheme
                                .overline!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: changeAvailableSizes,
                          child: Icon(
                            FontAwesomeIcons.exchange,
                            color: primaryColor,
                            size: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: itemBgColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => addItemQuantity(false),
                          child: Icon(
                            Icons.remove,
                            color: primaryColor,
                            size: 18,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          itemQuantity.toString(),
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () => addItemQuantity(true),
                          child: Icon(
                            Icons.add,
                            color: primaryColor,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                '${widget.cartProduct.productPrice}DT',
                style: Theme.of(context).textTheme.overline!.copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: primaryColor.withOpacity(0.9)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
