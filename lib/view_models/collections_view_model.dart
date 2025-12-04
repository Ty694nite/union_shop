import '../models/collection.dart';

class CollectionsViewModel {
  List<Collection> getCollections() {
    return [
      Collection(id: '1', name: 'Clothing'),
      Collection(id: '2', name: 'Accessories'),
    ];
  }
}
