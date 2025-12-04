import 'package:flutter/material.dart';
import '../view_models/home_view_model.dart';
import '../models/product.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = HomeViewModel().getProducts();

    return Scaffold(
      appBar: AppBar(title: const Text('Collection Example')),
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
