import '../models/product.dart';

class HomeViewModel {
  List<Product> getProducts() {
    return [
      Product(
          id: '1',
          title: 'Product 1',
          price: '£10.00',
          imageUrl: 'images/magnet_1.JPEG'),
      Product(
          id: '2',
          title: 'Product 2',
          price: '£15.00',
          imageUrl: 'images/postcard_1.JPEG'),
    ];
  }
}
