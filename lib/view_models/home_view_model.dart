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
          title: 'Essential T-Shirt',
          price: '£6.99',
          imageUrl: 'images/green_t_shirt.WEBP'),
    ];
  }

  List<Product> getSignatureProducts() {
    return [
      Product(
          id: '3',
          title: 'Signature Hoodie',
          price: '£29.99',
          imageUrl: 'images/signature_hoodie.WEBP'),
      Product(
          id: '4',
          title: 'Signature T_Shirt',
          price: '£9.99',
          imageUrl: 'images/signature_t_shirt.WEBP'),
    ];
  }
}
