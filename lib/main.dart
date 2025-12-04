import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'views/about_page.dart';
import 'views/collections_page.dart';
import 'views/collection_page.dart';
import 'views/product_page.dart';
import 'views/sale_page.dart';
import 'views/cart_page.dart';
import 'views/auth_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collection': (context) => const CollectionPage(),
        '/product': (context) => const ProductPage(),
        '/sale': (context) => const SalePage(),
        '/cart': (context) => const CartPage(),
        '/auth': (context) => const AuthPage(),
      },
    );
  }
}
