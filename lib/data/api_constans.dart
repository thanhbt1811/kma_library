class ApiConstants {
  /// Link API khai báo ở đây
  static const String login = '/Authentication/login';
  static const String categories = '/Categories';

  ///Book
  static const String books = '/Books/search-books';
  static const String hiringBook = '/Books/hire-books';
  static const String estimatingHireBook = 'Books/estimate-hire-date';
  static const String hireBook = '/Books/hire-book';
  static const String hiringBooks = '/Books/hiring-books';
  static const String returnedBook = '/Books/returned-books';
  static const String bookInTerm = '/Books/book-in-term';
  static const String estimatingBook = '/Books/estimating-books';
  static const String estimatedBook = '/Books/estimated-books';
  static const String estimateReturnedDate = '/Books/estimated-returned-date';
  static const String estimateReturnDate = '/Books/estimate-return-date';

  ///User
  static const String getMe = '/Authentication/get-me';
  static const String avatar = '/Authentication/thumbnail';

  ///Notification
  static const String notification = '/Notices';
  static const String newNoti = '/News';
}
