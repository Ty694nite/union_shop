import 'package:flutter/material.dart';
import '../view_models/home_view_model.dart';
import '../models/product.dart';

class CollectionPage extends StatelessWidget {
  final String collectionName;
  const CollectionPage({super.key, required this.collectionName});

  @override
  Widget build(BuildContext context) {
    // You can filter products by collectionName if needed
    final products = HomeViewModel().getProducts(); // Add filtering logic here

    return Scaffold(
      appBar: AppBar(title: Text(collectionName)),
      body: Column(
        children: [
          // Dummy filter dropdown
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: 'All',
              items: const [
                DropdownMenuItem(value: 'All', child: Text('All')),
                DropdownMenuItem(value: 'Clothing', child: Text('Clothing')),
                DropdownMenuItem(
                    value: 'Accessories', child: Text('Accessories')),
              ],
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final Product product = products[index];
                return ListTile(
                  leading: Image.network(product.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(product.title),
                  subtitle: Text(product.price),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
