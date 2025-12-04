import 'package:flutter/material.dart';
import '../view_models/cart_view_model.dart';
import '../models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = CartViewModel().getCartItems();

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final Product product = cartItems[index];
                return ListTile(
                  leading: Image.network(product.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(product.title),
                  subtitle: Text(product.price),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Dummy remove action
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Dummy checkout action
          },
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}
