import 'package:flutter/material.dart';
import '../view_models/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void placeholderCallbackForButtons() {}

  int _gridCrossAxisCount(double width) {
    if (width >= 1000) return 4; // desktop
    if (width >= 700) return 3; // tablet
    return 2; // phone
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4d2963),
              ),
              child: Text(
                'Union Shop',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              title: const Text('Sale'),
              onTap: () => Navigator.pushNamed(context, '/sale'),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              title: const Text('Collections'),
              onTap: () => Navigator.pushNamed(context, '/collections'),
            ),
            const ListTile(
              title: Text('The Print Shack'),
              // static for now
            ),
            ListTile(
              title: const Text('Account'),
              onTap: () => Navigator.pushNamed(context, '/auth'),
            ),
            ListTile(
              title: const Text('Cart'),
              onTap: () => Navigator.pushNamed(context, '/cart'),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final crossAxisCount = _gridCrossAxisCount(screenWidth);

          return SingleChildScrollView(
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
                        // Main header row (navbar)
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: Row(
                            children: [
                              // Logo
                              Image.network(
                                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                                height: 28,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.image_not_supported),
                              ),
                              const SizedBox(width: 16),

                              if (screenWidth >= 700) ...[
                                // FULL NAVBAR (desktop / tablet)
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/'),
                                  child: const Text('Home'),
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
                                PopupMenuButton<String>(
                                  padding: EdgeInsets.zero,
                                  tooltip: 'Shop',
                                  onSelected: (value) {
                                    if (value == 'collections') {
                                      Navigator.pushNamed(
                                          context, '/collections');
                                    }
                                  },
                                  itemBuilder: (context) => const [
                                    PopupMenuItem(
                                      value: 'collections',
                                      child: Text('Collections'),
                                    ),
                                  ],
                                  child: const Text(
                                    'Shop',
                                    style: TextStyle(
                                      color: Color(0xFF4d2963),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                const TextButton(
                                  onPressed:
                                      null, // Static button, does nothing for now
                                  child: Text(
                                    'The Print Shack',
                                    style: TextStyle(
                                      color: Color(0xFF4d2963),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.person_outline,
                                      color: Color(0xFF4d2963)),
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/auth'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.shopping_bag_outlined,
                                      color: Color(0xFF4d2963)),
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/cart'),
                                ),
                              ] else ...[
                                // COMPACT NAVBAR (mobile)
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.person_outline,
                                      color: Color(0xFF4d2963)),
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/auth'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.shopping_bag_outlined,
                                      color: Color(0xFF4d2963)),
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/cart'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.menu,
                                      color: Color(0xFF4d2963)),
                                  onPressed: () {
                                    // open the drawer
                                    Scaffold.of(context).openDrawer();
                                  },
                                ),
                              ],
                            ],
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
                        SizedBox(
                          child: GridView.count(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 3 / 4,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: HomeViewModel()
                                .getProducts()
                                .map((product) => InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/product');
                                      },
                                      child: Card(
                                        elevation: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                product.imageUrl,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(product.title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(product.price,
                                                  style: const TextStyle(
                                                      color: Colors.green)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Signature range section
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Signature range',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          child: GridView.count(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 3 / 4,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: HomeViewModel()
                                .getSignatureProducts()
                                .map((product) => InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/product');
                                      },
                                      child: Card(
                                        elevation: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                product.imageUrl,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(product.title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(product.price,
                                                  style: const TextStyle(
                                                      color: Colors.green)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Portsmouth City Collection section
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Portsmouth City Collection',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          child: GridView.count(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 3 / 4,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: HomeViewModel()
                                .getCityCollectionProducts()
                                .map((product) => InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/product');
                                      },
                                      child: Card(
                                        elevation: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                product.imageUrl,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(product.title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(product.price,
                                                  style: const TextStyle(
                                                      color: Colors.green)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Footer
                  Container(
                    width: double.infinity,
                    color: Colors.grey[50],
                    padding: const EdgeInsets.all(24),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Opening Hours',
                          style: TextStyle(
                            color: Color(0xFF4d2963),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Monday – Friday: 10:00 – 16:00\nSaturday – Sunday: Closed',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            color: Color(0xFF4d2963),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Email: unionshop@upsu.net\nPhone: 02392 843628',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Location',
                          style: TextStyle(
                            color: Color(0xFF4d2963),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'The Union Shop, The Hub,\nPortsmouth Students\' Union,\nCambridge Road, Portsmouth, PO1 2EF',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          '© 2025 Portsmouth Students\' Union. All rights reserved.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
