import 'package:flutter/material.dart';
import 'package:navigator_2_project/models/book.dart';
import 'package:navigator_2_project/widgets/book_details_screen.dart';

class BookDetailsPage extends Page {
  final Book? book;

  BookDetailsPage({
    required this.book,
  }) : super(key: ValueKey(book));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookDetailsScreen(book: book);
      },
    );
  }
}
