class Book {
  final String title;
  final String author;
  final String imagePath;
  final double price;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.price,
    required this.description,
  });
}

class Category {
  final String title;
  final String imagePath;
  final List<Book> books;

  Category({
    required this.title,
    required this.imagePath,
    required this.books,
  });
}

List<Category> categories = [
  Category(
    title: 'Fiction Books',
    imagePath: 'assets/images/1.jpeg',
    books: [
      Book(
        title: 'Book 1',
        author: 'Author 1',
        imagePath: 'assets/images/1.jpeg',
        price: 10.99,
        description: 'A gripping fictional story filled with suspense.',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        imagePath: 'assets/images/2.jpeg',
        price: 9.99,
        description: 'An intriguing literary masterpiece.',
      ),
      // Add more books here
    ],
  ),
  Category(
    title: 'Fantasy Books',
    imagePath: 'assets/images/1.jpeg',
    books: [
      Book(
        title: 'Book 1',
        author: 'Author 1',
        imagePath: 'assets/images/1.jpeg',
        price: 12.99,
        description: 'Embark on an enchanting journey through a magical world.',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        imagePath: 'assets/images/2.jpeg',
        price: 11.99,
        description: 'A captivating tale of mythical creatures and epic adventures.',
      ),
      // Add more books here
    ],
  ),
  Category(
    title: 'Romance Books',
    imagePath: 'assets/images/1.jpeg',
    books: [
      Book(
        title: 'Book 1',
        author: 'Author 1',
        imagePath: 'assets/images/1.jpeg',
        price: 8.99,
        description: 'Experience the tender moments of love and heartbreak.',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        imagePath: 'assets/images/2.jpeg',
        price: 7.99,
        description: 'A passionate story about finding true love against all odds.',
      ),
      // Add more books here
    ],
  ),
  Category(
    title: 'Books For Kids',
    imagePath: 'assets/images/1.jpeg',
    books: [
      Book(
        title: 'Book 1',
        author: 'Author 1',
        imagePath: 'assets/images/1.jpeg',
        price: 6.99,
        description: 'Engaging and educational books for young readers.',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        imagePath: 'assets/images/2.jpeg',
        price: 5.99,
        description: 'Fun-filled stories that spark imagination and creativity.',
      ),
      // Add more books here
    ],
  ),
  Category(
    title: 'Science Books',
    imagePath: 'assets/images/1.jpeg',
    books: [
      Book(
        title: 'Book 1',
        author: 'Author 1',
        imagePath: 'assets/images/1.jpeg',
        price: 14.99,
        description: 'Discover the wonders of the universe and scientific breakthroughs.',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        imagePath: 'assets/images/2.jpeg',
        price: 13.99,
        description: 'Insightful books that explore various scientific disciplines.',
      ),
      // Add more books here
    ],
  ),
  Category(
    title: 'Romance',
    imagePath: 'assets/images/1.jpeg',
    books: [
      Book(
        title: 'Book 3',
        author: 'Author 3',
        imagePath: 'assets/images/3.jpeg',
        price: 9.99,
        description: 'A heartwarming love story that will leave you breathless.',
      ),
      Book(
        title: 'Book 4',
        author: 'Author 4',
        imagePath: 'assets/images/1.jpeg',
        price: 8.99,
        description: 'A tale of passion and desire set in a picturesque location.',
      ),
      // Add more books here
    ],
  ),
  // Add more categories here
];