import 'package:flutter/material.dart';
import '../view_models/collections_view_model.dart';
import '../models/collection.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final collections = CollectionsViewModel().getCollections();

    return Scaffold(
      appBar: AppBar(title: const Text('Collections')),
      body: ListView.builder(
        itemCount: collections.length,
        itemBuilder: (context, index) {
          final Collection collection = collections[index];
          return ListTile(
            title: Text(collection.name),
            onTap: () {
              // You can add navigation to the collection page here later
            },
          );
        },
      ),
    );
  }
}
