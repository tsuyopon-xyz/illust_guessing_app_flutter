import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart' show Database;
import 'package:illust_guessing_app/src/db/database_client.dart';

void main() {
  late Database db;

  setUpAll(() async {
    db = await DatabaseClient.instance.database;
  });

  tearDownAll(() async {
    await db.close();
  });

  test('DB Version is 1', () async {
    expect(await db.getVersion(), 1);
  });

  test('quizzes table(master table) has more than 1 records', () async {
    List<Map<String, Object?>> records = await db.query('quizzes');

    expect(records.isNotEmpty, true);
    records.asMap().forEach((index, record) {
      int expectedId = index + 1;
      expect(record['id'], expectedId);
    });
  });

  test('chapters table(master table) has more than 1 records', () async {
    List<Map<String, Object?>> records = await db.query('chapters');

    expect(records.isNotEmpty, true);
    records.asMap().forEach((index, record) {
      int expectedId = index + 1;
      expect(record['id'], expectedId);
    });
  });
}
