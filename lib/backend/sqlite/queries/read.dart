import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN READ BOOKS
Future<List<ReadBooksRow>> performReadBooks(
  Database database,
) {
  final query = '''
select*from books;
''';
  return _readQuery(database, query, (d) => ReadBooksRow(d));
}

class ReadBooksRow extends SqliteRow {
  ReadBooksRow(Map<String, dynamic> data) : super(data);

  String get title => data['title'] as String;
  int get id => data['id'] as int;
  String? get author => data['author'] as String?;
  String? get language => data['language'] as String?;
  String? get description => data['description'] as String?;
}

/// END READ BOOKS

/// BEGIN FETCHCHAPTERS
Future<List<FetchChaptersRow>> performFetchChapters(
  Database database,
) {
  final query = '''
select*from chapters;
''';
  return _readQuery(database, query, (d) => FetchChaptersRow(d));
}

class FetchChaptersRow extends SqliteRow {
  FetchChaptersRow(Map<String, dynamic> data) : super(data);

  String get title => data['title'] as String;
  String get content => data['content'] as String;
  int get number => data['number'] as int;
  int get bookId => data['book_id'] as int;
}

/// END FETCHCHAPTERS
