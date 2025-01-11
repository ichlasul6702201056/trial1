class Book {
  final String title;
  final String author;
  final int year;
  final String coverImage;

  Book(
      {required this.title,
      required this.author,
      required this.year,
      required this.coverImage});
}

// Dummy book data
List<Book> dumtrial1s = [
  Book(
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
    year: 1925,
    coverImage: 'https://example.com/great_gatsby.jpg',
  ),
  Book(
    title: '1984',
    author: 'George Orwell',
    year: 1949,
    coverImage: 'https://example.com/1984.jpg',
  ),
  Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    year: 1960,
    coverImage: 'https://example.com/to_kill_a_mockingbird.jpg',
  ),
  Book(
    title: 'The Catcher in the Rye',
    author: 'J.D. Salinger',
    year: 1951,
    coverImage: 'https://example.com/catcher_in_the_rye.jpg',
  ),
  Book(
    title: 'Moby-Dick',
    author: 'Herman Melville',
    year: 1851,
    coverImage: 'https://example.com/moby_dick.jpg',
  ),
  Book(
    title: 'Pride and Prejudice',
    author: 'Jane Austen',
    year: 1813,
    coverImage: 'https://example.com/pride_and_prejudice.jpg',
  ),
  Book(
    title: 'War and Peace',
    author: 'Leo Tolstoy',
    year: 1869,
    coverImage: 'https://example.com/war_and_peace.jpg',
  ),
  Book(
    title: 'The Hobbit',
    author: 'J.R.R. Tolkien',
    year: 1937,
    coverImage: 'https://example.com/the_hobbit.jpg',
  ),
];
