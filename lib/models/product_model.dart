class Product {
  final String productName;
  final String productDescription;
  final double productOldPrice;
  final double productPrice;
  final String productType;
  final bool productOversize;
  final String productImage;
  final List<String> availableSizes;

  Product({required this.productName, required this.productDescription, required this.productOldPrice, required this.productPrice, required this.productType, required this.productOversize, required this.productImage, required this.availableSizes});
}