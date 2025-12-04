import '../models/product.dart';

class HomeViewModel {
  List<Product> getProducts() {
    return [
      Product(
          id: '1',
          title: 'Product 1',
          price: '£10.00',
          imageUrl: 'https://...'),
      Product(
          id: '2',
          title: 'Product 2',
          price: '£15.00',
          imageUrl: 'https://...'),
    ];
  }
}
