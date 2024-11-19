import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:specialdesire/components/basic/cart_item.dart';
import 'package:specialdesire/constants/colors.dart';
import 'package:specialdesire/data/cart_datas.dart';
import 'package:specialdesire/models/product_model.dart';
import 'package:specialdesire/screens/shop_page.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void goBackToHomePage(BuildContext context) {
    Navigator.of(context).popUntil(ModalRoute.withName('/shop_page'));
  }

  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
      getItemsTotalPrice(context);
  }

  void getItemsTotalPrice(BuildContext context) {
    // Use context.read instead of context.watch
    totalPrice = context.read<Cart>().getCartTotal();
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
          'MY CART',
          style: Theme.of(context).textTheme.overline!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 20, color: primaryColor),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Icon(
        //       Icons.shopping_bag_outlined,
        //       color: primaryColor,
        //       size: 27,
        //     ),
        //   )
        // ],
        backgroundColor: bgColor,
        centerTitle: true,
        toolbarHeight: 72,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 9.0),
                child: Text(
                  '${context.watch<Cart>().getItemsCount()} ITEMS IN CART',
                  style: Theme.of(context).textTheme.overline!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryColor),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ...context.watch<Cart>().shoppingCart.map(
                    (e) => CardItem(cartProduct: e),
                  ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TOTAL',
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: bgColor.withOpacity(0.7)),
                        ),
                        Text(
                          '${totalPrice}DT',
                          style: Theme.of(context).textTheme.overline!.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: bgColor,
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bgColor,
                            foregroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            )),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/credits_page'),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'CHECK OUT',
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(
                                        fontSize: 20,
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: primaryColor,
                                size: 22,
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
          ),
        ],
      ),
    );
  }
}
