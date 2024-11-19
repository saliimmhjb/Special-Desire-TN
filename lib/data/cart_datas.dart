import 'package:flutter/material.dart';
import 'package:specialdesire/models/product_model.dart';

class Cart extends ChangeNotifier {
  List<Product> shoppingCart = [];

  void addItemToCart(Product item) {
    shoppingCart.add(item);
    notifyListeners();
  }

  void removeItemFromCart(Product item) {
    shoppingCart.remove(item);
    notifyListeners();
  }

  int getItemsCount() {
    return shoppingCart.length;
  }

  double getCartTotal() {
    double totalPrice = 0;
    for (Product item in shoppingCart) {
      print('Product: ${item.productName}, Price: ${item.productPrice}');
      totalPrice += item.productPrice;
    }
    print('Total Price: $totalPrice');
    return totalPrice;
  }


  List<Product> favoritesItems = [];

  void addItemToFavorites(Product item) {
    favoritesItems.add(item);
    notifyListeners();
  }

  void removeItemFromFavorites(Product item) {
    favoritesItems.remove(item);
    notifyListeners();
  }
}

