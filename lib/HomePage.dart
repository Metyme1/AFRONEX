import 'package:afronex/productDetail.dart';  // Check if the file name and location are correct
import 'package:flutter/material.dart';
import 'product.dart';  // Ensure this is the correct path for your Product model

class HomePage extends StatelessWidget {
  final List<Product> products;

  HomePage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(products[index].imageUrl),  // Use Image.asset for local images
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price}'),
            onTap: () {
              // Navigate to Product Details Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
