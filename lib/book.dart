// class Book {
//   final String title;
//   final String author;
//   final String imagePath;
//   final double price;
//   final String description;
//
//   Book({
//     required this.title,
//     required this.author,
//     required this.imagePath,
//     required this.price,
//     required this.description,
//   });
// }
//
// class Category {
//   final String title;
//   final String imagePath;
//   final List<Book> books;
//
//   Category({
//     required this.title,
//     required this.imagePath,
//     required this.books,
//   });
// }
//
// List<Category> categories = [
//   Category(
//     title: 'Fiction Books',
//     imagePath: 'assets/images/1.jpeg',
//     books: [
//       Book(
//         title: 'Book 1',
//         author: 'Author 1',
//         imagePath: 'assets/images/1.jpeg',
//         price: 10.99,
//         description: 'A gripping fictional story filled with suspense.',
//       ),
//       Book(
//         title: 'Book 2',
//         author: 'Author 2',
//         imagePath: 'assets/images/2.jpeg',
//         price: 9.99,
//         description: 'An intriguing literary masterpiece.',
//       ),
//       // Add more books here
//     ],
//   ),
//   Category(
//     title: 'Fantasy Books',
//     imagePath: 'assets/images/1.jpeg',
//     books: [
//       Book(
//         title: 'Book 1',
//         author: 'Author 1',
//         imagePath: 'assets/images/1.jpeg',
//         price: 12.99,
//         description: 'Embark on an enchanting journey through a magical world.',
//       ),
//       Book(
//         title: 'Book 2',
//         author: 'Author 2',
//         imagePath: 'assets/images/2.jpeg',
//         price: 11.99,
//         description: 'A captivating tale of mythical creatures and epic adventures.',
//       ),
//       // Add more books here
//     ],
//   ),
//   Category(
//     title: 'Romance Books',
//     imagePath: 'assets/images/1.jpeg',
//     books: [
//       Book(
//         title: 'Book 1',
//         author: 'Author 1',
//         imagePath: 'assets/images/1.jpeg',
//         price: 8.99,
//         description: 'Experience the tender moments of love and heartbreak.',
//       ),
//       Book(
//         title: 'Book 2',
//         author: 'Author 2',
//         imagePath: 'assets/images/2.jpeg',
//         price: 7.99,
//         description: 'A passionate story about finding true love against all odds.',
//       ),
//       // Add more books here
//     ],
//   ),
//   Category(
//     title: 'Books For Kids',
//     imagePath: 'assets/images/1.jpeg',
//     books: [
//       Book(
//         title: 'Book 1',
//         author: 'Author 1',
//         imagePath: 'assets/images/1.jpeg',
//         price: 6.99,
//         description: 'Engaging and educational books for young readers.',
//       ),
//       Book(
//         title: 'Book 2',
//         author: 'Author 2',
//         imagePath: 'assets/images/2.jpeg',
//         price: 5.99,
//         description: 'Fun-filled stories that spark imagination and creativity.',
//       ),
//       // Add more books here
//     ],
//   ),
//   Category(
//     title: 'Science Books',
//     imagePath: 'assets/images/1.jpeg',
//     books: [
//       Book(
//         title: 'Book 1',
//         author: 'Author 1',
//         imagePath: 'assets/images/1.jpeg',
//         price: 14.99,
//         description: 'Discover the wonders of the universe and scientific breakthroughs.',
//       ),
//       Book(
//         title: 'Book 2',
//         author: 'Author 2',
//         imagePath: 'assets/images/2.jpeg',
//         price: 13.99,
//         description: 'Insightful books that explore various scientific disciplines.',
//       ),
//       // Add more books here
//     ],
//   ),
//   Category(
//     title: 'Romance',
//     imagePath: 'assets/images/1.jpeg',
//     books: [
//       Book(
//         title: 'Book 3',
//         author: 'Author 3',
//         imagePath: 'assets/images/3.jpeg',
//         price: 9.99,
//         description: 'A heartwarming love story that will leave you breathless.',
//       ),
//       Book(
//         title: 'Book 4',
//         author: 'Author 4',
//         imagePath: 'assets/images/1.jpeg',
//         price: 8.99,
//         description: 'A tale of passion and desire set in a picturesque location.',
//       ),
//       // Add more books here
//     ],
//   ),
//   // Add more categories here
// ];


class Book {
  final String id;
  final String title;
  final String author;
  final String imagePath;
  final double price;
  final String description;
  final double rating;
  final int reviewCount;
  int quantity; // Add this line for representing the quantity

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.quantity, // Add this line
  });
}

class Category {
  final String id;
  final String title;
  final String imagePath;
  final List<Book> books;
  final double rating;

  Category({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.books,
    required this.rating,
  });
}

List<Category> categories = [
  // Fiction Books Category
  Category(
    id: 'fiction',
    title: 'Fiction Books',
    imagePath: 'assets/images/fi1.jpg',
    rating: 4.8,
    books: [
      Book(
        id: '400',
        title: 'Where Sleeping Girls Lie',
        author: 'Faridah Àbíké-Íyímídé',
        imagePath: 'assets/images/fi1.jpg',
        price: 10.99,
        description: 'In Where Sleeping Girls Lie ― a YA contemporary mystery by Faridah Àbíké-Íyímídé, the New York Times-bestselling author of Ace of Spades ― a girl new to boarding school discovers dark secrets and coverups after her roommate disappears.',
        rating: 4.9, reviewCount: 123, quantity: 5,
      ),
      Book(
        id: '401',
        title: 'The Morningside',
        author: 'Téa Obreht',
        imagePath: 'assets/images/fi2.jpg',
        price: 10.99,
        description: 'In Where Sleeping Girls Lie ― a YA contemporary mystery by Faridah Àbíké-Íyímídé, the New York Times-bestselling author of Ace of Spades ― a girl new to boarding school discovers dark secrets and coverups after her roommate disappears.',
        rating: 4.9, reviewCount: 123, quantity: 5,
      ),
      Book(
        id: '402',
        title: 'The Underground Library',
        author: 'Jennifer Ryan',
        imagePath: 'assets/images/fi3.jpg',
        price: 10.99,
        description: 'In Where Sleeping Girls Lie ― a YA contemporary mystery by Faridah Àbíké-Íyímídé, the New York Times-bestselling author of Ace of Spades ― a girl new to boarding school discovers dark secrets and coverups after her roommate disappears.',
        rating: 4.9, reviewCount: 123, quantity: 5,
      ),


      // Add more books here
    ],
  ),
  // Fantasy Books Category
  Category(
    id: 'fantasy',
    title: 'Fantasy Books',
    imagePath: 'assets/images/fa1.jpg',
    rating: 4.7,
    books: [
      Book(
        id: '200',
        title: 'A Feather So Black',
        author: 'Lyra Selene',
        imagePath: 'assets/images/fa1.jpg',
        price: 9.99,
        description: 'Set in a world of perilous magic and moonlit forests, this seductive romantic fantasy tells the story of a defiant changeling, her cursed sister, and the dangerous fae lord she must defeat to save her family.',
        rating: 4.8, reviewCount: 100, quantity: 3,
      ),
      Book(
        id: '201',
        title: 'Floating Hotel',
        author: 'Grace Curtis',
        imagePath: 'assets/images/fa2.jpg',
        price: 9.99,
        description: 'Welcome to the Grand Abeona Hotel: home of the finest food, the sweetest service, and the very best views the galaxy has to offer. All year round it moves from planet to planet, system to system',
        rating: 4.8, reviewCount: 100, quantity: 3,
      ),
      Book(
        id: '202',
        title: 'A Cursed Son',
        author: 'Day Leitao',
        imagePath: 'assets/images/fa3.jpg',
        price: 9.99,
        description: 'Romantic & sexy dreams link a false princess to a dangerous, disgraced fae prince in this fun, steamy enemies-to-lovers romantasy.',
        rating: 4.8, reviewCount: 100, quantity: 3,
      ),
    ],
  ),
  // Romance Books Category
  Category(
    id: 'romance',
    title: 'Romance Books',
    imagePath: 'assets/images/ro1.jpg',
    rating: 4.6,
    books: [
      Book(
        id: '300',
        title: 'This Could Be Us',
        author: 'Kennedy Ryan',
        imagePath: 'assets/images/ro1.jpg',
        price: 9.99,
        description: "Soledad Barnes has her life all planned out. Because, of course, she does. She plans everything. She designs everything. She fixes everything. She’s a domestic goddess who's never met a party she couldn't host or a charge she couldn't lead.",
        rating: 4.8, reviewCount: 100, quantity: 5,
      ),
      Book(
        id: '301',
        title: 'This Could Be Us',
        author: 'Kennedy Ryan',
        imagePath: 'assets/images/ro1.jpg',
        price: 9.99,
        description: "Soledad Barnes has her life all planned out. Because, of course, she does. She plans everything. She designs everything. She fixes everything. She’s a domestic goddess who's never met a party she couldn't host or a charge she couldn't lead.",
        rating: 4.8, reviewCount: 100, quantity: 5,
      ),
      Book(
        id: '302',
        title: 'The Emperor and the Endless Palace',
        author: 'Justinian Huang',
        imagePath: 'assets/images/ro3.jpg',
        price: 9.99,
        description: "Soledad Barnes has her life all planned out. Because, of course, she does. She plans everything. She designs everything. She fixes everything. She’s a domestic goddess who's never met a party she couldn't host or a charge she couldn't lead.",
        rating: 4.8, reviewCount: 100, quantity: 5,
      ),
    ],
  ),
  // Books For Kids Category
  Category(
    id: 'kids',
    title: 'Books For Kids',
    imagePath: 'assets/images/kid1.jpeg',
    rating: 4.9,
    books: [
      Book(
        id: '100',
        title: 'Big Cheese',
        author: 'Jory John',
        imagePath: 'assets/images/kid1.jpeg',
        price: 9.99,
        description: 'The Big Cheese - Book Review - What Book Next.com. The Big Cheese was once just a tiny curd in a bowl of other curds, but one day he decided he wanted more. He wanted to be the BIG CHEESE. His quest to be the best at EVERYTHING began, resulting in sports, speaking, theatre, and fashion FAME.',
        rating: 4.8, reviewCount: 100, quantity: 9,
      ),
      Book(
        id: '101',
        title: 'The Wonderful Things You Will Be?',
        author: 'Emily Winfield Martin',
        imagePath: 'assets/images/kid2.jpeg',
        price: 9.99,
        description: 'The Big Cheese - Book Review - What Book Next.com. The Big Cheese was once just a tiny curd in a bowl of other curds, but one day he decided he wanted more. He wanted to be the BIG CHEESE. His quest to be the best at EVERYTHING began, resulting in sports, speaking, theatre, and fashion FAME.',
        rating: 4.8, reviewCount: 100, quantity: 9,
      ),
      Book(
        id: '102',
        title: 'Dog Man',
        author: 'George R. Maclay',
        imagePath: 'assets/images/kid3.jpeg',
        price: 9.99,
        description: 'The Big Cheese - Book Review - What Book Next.com. The Big Cheese was once just a tiny curd in a bowl of other curds, but one day he decided he wanted more. He wanted to be the BIG CHEESE. His quest to be the best at EVERYTHING began, resulting in sports, speaking, theatre, and fashion FAME.',
        rating: 4.8, reviewCount: 100, quantity: 9,
      ),
    ],
  ),
  // Science Books Category
  Category(
    id: 'science',
    title: 'Science Books',
    imagePath: 'assets/images/sc1.jpg',
    rating: 4.7,
    books: [
      Book(
        id: '500',
        title: 'The Mars House',
        author: 'Natasha Pulley',
        imagePath: 'assets/images/sc1.jpg',
        price: 9.99,
        description: 'From the author of The Watchmaker of Filigree Street, a queer sci-fi novel about an Earth refugee and a Mars politician who fake marry to save their reputations—and their planet.',
        rating: 4.8, reviewCount: 100, quantity: 23,
      ),
    ],
  ),
  // More categories can be added here
];
