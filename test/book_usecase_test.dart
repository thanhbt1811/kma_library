import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test get book with date", () {
    final Map<DateTime, List<BookTest>> returnedMap =
        <DateTime, List<BookTest>>{};
    final itemDate = books[0].date;
    var date = DateTime(itemDate.year, itemDate.month, itemDate.day);
    returnedMap.putIfAbsent(date, () => [books[0]]);
    for (var index = 1; index < books.length; index++) {
      final book = books[index];
      final bookDate = DateTime(book.date.year, book.date.month, book.date.day);
      if (bookDate == date) {
        returnedMap[bookDate]?.add(book);
      } else {
        date = bookDate;
        returnedMap.putIfAbsent(date, () => [book]);
      }
    }
    if (kDebugMode) {
      print('message');
    }
    if (kDebugMode) {
      final keys = returnedMap.keys.toList();
      for (final key in keys) {
        print("date: $key");
        final datas = returnedMap[key] ?? [];
        for (final data in datas) {
          print(data);
        }
      }
    }
  });
}

class BookTest {
  final int id;
  final String name;
  final DateTime date;

  BookTest(this.id, this.name, this.date);

  @override
  String toString() {
    return 'BookTest{id: $id, name: $name, date: $date}\n';
  }
}

final now = DateTime.now();
final books = [
  BookTest(
    1,
    "TestCase1",
    DateTime.now(),
  ),
  BookTest(
    2,
    "TestCase2",
    DateTime.now(),
  ),
  BookTest(
    3,
    "TestCase3",
    DateTime.now(),
  ),
  BookTest(
    4,
    "TestCase4",
    DateTime.now(),
  ),
  BookTest(
    5,
    "TestCase5",
    DateTime(now.year, now.month, now.day + 1),
  ),
  BookTest(
    6,
    "TestCase6",
    DateTime(now.year, now.month, now.day + 1),
  ),
  BookTest(
    7,
    "TestCase7",
    DateTime(now.year, now.month, now.day + 2),
  ),
  BookTest(
    8,
    "TestCase8",
    DateTime(now.year, now.month, now.day + 2),
  ),
];
