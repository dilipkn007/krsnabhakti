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
  String get cover => data['cover'] as String;
}

/// END READ BOOKS

/// BEGIN FETCHCHAPTERS
Future<List<FetchChaptersRow>> performFetchChapters(
  Database database, {
  int? bookId,
}) {
  final query = '''
SELECT * FROM chapters WHERE book_id = ${bookId} AND parent_id=0 ORDER BY number;
''';
  return _readQuery(database, query, (d) => FetchChaptersRow(d));
}

class FetchChaptersRow extends SqliteRow {
  FetchChaptersRow(Map<String, dynamic> data) : super(data);

  String get title => data['title'] as String;
  String get content => data['content'] as String;
  int get number => data['number'] as int;
  int get bookId => data['book_id'] as int;
  int get id => data['id'] as int;
  int get parentId => data['parent_id'] as int;
}

/// END FETCHCHAPTERS

/// BEGIN FETCHSUBCHAPTERS
Future<List<FetchSubChaptersRow>> performFetchSubChapters(
  Database database, {
  int? chapterId,
}) {
  final query = '''
SELECT * FROM chapters WHERE parent_id = ${chapterId} ORDER BY number;;
''';
  return _readQuery(database, query, (d) => FetchSubChaptersRow(d));
}

class FetchSubChaptersRow extends SqliteRow {
  FetchSubChaptersRow(Map<String, dynamic> data) : super(data);

  String get title => data['title'] as String;
  String get content => data['content'] as String;
  int get number => data['number'] as int;
  int get bookId => data['book_id'] as int;
  int get id => data['id'] as int;
  int get parentId => data['parent_id'] as int;
}

/// END FETCHSUBCHAPTERS

/// BEGIN FETCHCHAPTERSCONTENT
Future<List<FetchChaptersContentRow>> performFetchChaptersContent(
  Database database, {
  int? bookId,
  int? parentId,
}) {
  final query = '''
SELECT * FROM chapters WHERE book_id = ${bookId} AND parent_id=${parentId} ORDER BY number;
''';
  return _readQuery(database, query, (d) => FetchChaptersContentRow(d));
}

class FetchChaptersContentRow extends SqliteRow {
  FetchChaptersContentRow(Map<String, dynamic> data) : super(data);

  String get title => data['title'] as String;
  String get content => data['content'] as String;
  int get number => data['number'] as int;
  int get bookId => data['book_id'] as int;
  int get id => data['id'] as int;
  int get parentId => data['parent_id'] as int;
}

/// END FETCHCHAPTERSCONTENT
