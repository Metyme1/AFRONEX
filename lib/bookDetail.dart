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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Handle favorite action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: book.id,
              child: Image.asset(
                book.imagePath,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            Container(
              color: Colors.green, // Replace with custom color for your app
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      book.author,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '⭐ ${book.rating.toString()} (${book.reviewCount.toString()} reviews)',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      book.description,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Cart.addToCart(book);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ));
                        },
                        icon: Icon(Icons.add_shopping_cart, color: Colors.black),
                        label: Text('Add to Cart', style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(200.0, 50.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
