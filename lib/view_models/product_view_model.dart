import '../models/product.dart';

class ProductViewModel {
  Product getProductById(String id) {
    return Product(
        id: id,
        title: 'Product $id',
        price: '£6.99',
        imageUrl: 'image/green_t_shirt.WEBP');
  }
}
