import '../models/product.dart';

class ProductViewModel {
  Product getProductById(String id) {
    // Dummy data
    return Product(
        id: id, title: 'Product $id', price: '£10.00', imageUrl: 'https://...');
  }
}
