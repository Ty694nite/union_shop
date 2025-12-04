import '../models/product.dart';

class CartViewModel {
  final List<Product> cartItems = [];

  void addToCart(Product product) {
    cartItems.add(product);
  }

  List<Product> getCartItems() => cartItems;
}
