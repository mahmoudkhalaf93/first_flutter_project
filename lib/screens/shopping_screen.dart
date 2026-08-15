import 'package:flutter/material.dart';
import '../gen_l10n/app_localizations.dart';

/// Stateful widget for the main Shopping Screen
class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  // Sample product data
  final List<Map<String, String>> products = [
    {
      'name': 'Product 1',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGRKVN4adZ1wls_J-ePhKxO8VW2xiTPfMQcXxN_QlHlT44Ghxq7_vVrD5y&s=10',
    },
    {
      'name': 'Product 2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlRqLlDnCiqarLf7GJ0C3ago4htTIO7HyUKbRdjYKuOQ&s=10',
    },
    {
      'name': 'Product 3',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbK2_piX5eQw5G4XCZegPHmIzWUVEISGCuP7vi4wJlPw&s=10',
    },
    {
      'name': 'Product 4',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYPbw6O85uT46TA-zao6LuvgunrCQ5KTeSlZ9Ush-oAQ&s=10',
    },
  ];

  // Sample offers data
  final List<Map<String, String>> offers = [
    {
      'title': 'Hot Offer 1',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAGs6jiuwfcfi2WPutHyqOKlCgMPcTN-Zz50cmjNrbXg&s=10',
    },
    {
      'title': 'Hot Offer 2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZcUmTzkc-OpciAVfXzMFP4FuwEoQ41NfmKbIsWs9XrQ&s',
    },
    {
      'title': 'Hot Offer 3',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYF9hhwgg_gP7re_KDRxXc88FeB5oPYaEK6k-N5OrHQ&s=10',
    },
    {
      'title': 'Hot Offer 4',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_seqxED4JwVb_NhvB_AVg8xZddnquiQlvUtnWqNJ2Lg&s=10',
    },
    {
      'title': 'Hot Offer 5',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM5aY1RWmALupu5rOcvb_pGRZI7KbcQ32n-rz46njsiw&s=10',
    },
  ];

  /// Show snackbar when item is added to cart
  void _addToCart(String productName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item added to the cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Store'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Our Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Our Products',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // PageView for products
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        products[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // GridView for products with cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(context, products[index]);
                },
              ),
            ),
            const SizedBox(height: 30),
            // Hot Offers Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hot Offers',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // ListView for offers
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return _buildOfferItem(context, offers[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Build a product card widget
  Widget _buildProductCard(BuildContext context, Map<String, String> product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Image.network(
                product['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  product['name']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('\$19.99', style: TextStyle(fontSize: 10)),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      iconSize: 18,
                      onPressed: () => _addToCart(product['name']!),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build an offer item widget
  Widget _buildOfferItem(BuildContext context, Map<String, String> offer) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              offer['image']!,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            offer['title']!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
