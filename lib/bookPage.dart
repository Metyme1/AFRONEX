import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'book.dart';
import 'bookDetail.dart';
import 'cart.dart';

class BooksPage extends StatelessWidget {
  final Category category;

  const BooksPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final Color appColor = const Color(0xFF8A95D6); // Define the app color

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(category.title)),
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
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
                ),
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
                      SizedBox(width: 30.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.0), // Add space above the book title
                            Text(
                              book.title,
                              style: TextStyle(
                                fontSize: 18.0,

                                color: Colors.black, // Use the app color for the book title
                              ),
                            ),
                            SizedBox(height: 8.0), // Add space between the book title and author
                            Text(
                              book.author,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black54
                              ),
                            ),
                            SizedBox(height: 8.0), // Add space between the author and price
                            Text(
                              '\$${book.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0), // Add space below the price
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
      bottomNavigationBar: BottomAppBar(
        color: appColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SearchPage()),
                // );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => FavoritePage()),
                // );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}