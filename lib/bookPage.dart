import 'package:flutter/material.dart';
import 'book.dart';
import 'bookDetail.dart';

class BooksPage extends StatelessWidget {
  final Category category;

  const BooksPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final Color appColor = const Color(0xFF3E2F84); // Define the app color

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: appColor, // Use the app color for the app bar background
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: category.books.length,
          itemBuilder: (context, index) {
            final book = category.books[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailPage(book: book),
                  ),
                );
              },
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        book.imagePath,
                        width: 72.0,
                        height: 72.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: appColor, // Use the app color for the book title
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              book.author,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '\$${book.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}