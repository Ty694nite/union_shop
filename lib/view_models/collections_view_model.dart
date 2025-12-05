import '../models/collection.dart';

class CollectionsViewModel {
  List<Collection> getCollections() {
    return [
      Collection(
        id: '1',
        name: 'Clothing',
        imageUrl: 'assets/images/green_t_shirt.WEBP',
      ),
      Collection(
        id: '2',
        name: 'Accessories',
        imageUrl: 'assets/images/magnet_1.JPEG',
      ),
      Collection(
        id: '3',
        name: 'Signature',
        imageUrl: 'assets/images/signature_hoodie.WEBP',
      ),
      // Add more collections as needed
    ];
  }
}
