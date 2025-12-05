import 'package:flutter/material.dart';
import '../view_models/home_view_model.dart';
import '../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              // Header
              Container(
                height: 200,
                color: Colors.white,
                child: Column(
                  children: [
                    // Top banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: const Color(0xFF4d2963),
                      child: const Column(
                        children: [
                          Text(
                            'UNION SHOP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Portsmouth Students\' Union',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Main header row (icons, logo, etc.)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/logo.avif',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/collections'),
                              child: const Text('Collections'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/sale'),
                              child: const Text('Sale'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/about'),
                              child: const Text('About'),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.search,
                                  size: 18, color: Colors.grey),
                              onPressed: placeholderCallbackForButtons,
                            ),
                            IconButton(
                              icon: const Icon(Icons.person_outline,
                                  size: 18, color: Colors.grey),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/auth'),
                            ),
                            IconButton(
                              icon: const Icon(Icons.shopping_bag_outlined,
                                  size: 18, color: Colors.grey),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/cart'),
                            ),
                            IconButton(
                              icon: const Icon(Icons.menu,
                                  size: 18, color: Colors.grey),
                              onPressed: placeholderCallbackForButtons,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Hero Section
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'images/postcard_1.JPEG',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 24,
                      right: 24,
                      top: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome to the Union Shop!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Shop Portsmouth Students' Union",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Content Section (replace with page-specific content)
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Essential range',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ...HomeViewModel().getProducts().map((product) => ListTile(
                          leading: Image.asset(product.imageUrl,
                              width: 50, height: 50, fit: BoxFit.cover),
                          title: Text(product.title),
                          subtitle: Text(product.price),
                        )),
                  ],
                ),
              ),

              // Footer
              Container(
                width: double.infinity,
                color: Colors.grey[50],
                padding: const EdgeInsets.all(24),
                child: const Text(
                  'Placeholder Footer',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
