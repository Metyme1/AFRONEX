import 'package:flutter/material.dart';
import 'book.dart';
import 'cart.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              book.imagePath,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'Title: ${book.title}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Author: ${book.author}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Description: ${book.description}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                Cart.addToCart(book); // Add the selected book to the cart
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartPage(),
                ));
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Change to the desired teal color
                minimumSize: Size(200.0, 50.0), // Adjust the height and width as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}