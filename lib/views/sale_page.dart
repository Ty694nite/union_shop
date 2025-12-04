import 'package:flutter/material.dart';
import '../view_models/home_view_model.dart';
import '../models/product.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    // For demo, use the same products but show a "discounted" price
    final products = HomeViewModel().getProducts();

    return Scaffold(
      appBar: AppBar(title: const Text('Sale Items')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Big Sale! Save up to 50% on selected items.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final Product product = products[index];
                  return ListTile(
                    leading: Image.network(product.imageUrl,
                        width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(product.title),
                    subtitle: Text(
                      'Was ${product.price}  Now £${(double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0 * 0.7).toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.green),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
