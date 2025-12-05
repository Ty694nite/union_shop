import '../models/product.dart';

class HomeViewModel {
  List<Product> getProducts() {
    return [
      Product(
          id: '1',
          title: 'Essential Zip Hoodie',
          price: '£14.99',
          imageUrl: 'images/pink_essential_hoodie.WEBP'),
      Product(
          id: '2',
          title: 'Essential T Shirt',
          price: '£6.99',
          imageUrl: 'images/green_t_shirt.WEBP'),
    ];
  }
}
