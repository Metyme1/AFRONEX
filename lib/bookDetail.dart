import 'package:flutter/material.dart';
import 'book.dart';
import 'cart.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    Color customColor = Color(0xFF123456);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Image.asset(
                        book.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.0),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                  ),
                ],
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
              Container(
                height: 200.0,
                child: SingleChildScrollView(
                  child: Text(
                    'Description: ${book.description}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Cart.addToCart(book); // Add the selected book to the cart
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
                  },
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    primary: customColor, // Change to your desired color
                    minimumSize: Size(200.0, 50.0), // Adjust the height and width as needed
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