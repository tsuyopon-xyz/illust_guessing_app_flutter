import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:illust_guessing_app/src/constants/constants.dart'
    show
        CHAPTERS_TABLE_NAME,
        QUIZZES_TABLE_NAME,
        COMPLETED_QUIZZES_TABLE_NAME,
        COMPLETED_CHAPTERS_TABLE_NAME;

class DatabaseClient {
  DatabaseClient._privateConstructor();

  static final DatabaseClient instance = DatabaseClient._privateConstructor();
  static const String _databaseFileName = 'illust_guessing_app.db';
  static const int _databaseVersion = 1;

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      sqfliteFfiInit();
      final options = OpenDatabaseOptions(
          version: _databaseVersion,
          onCreate: _onCreate,
          onConfigure: _onConfigure);
      return await databaseFactoryFfi.openDatabase(inMemoryDatabasePath,
          options: options);
    } else if (UniversalPlatform.isWeb) {
      // 参考記事: https://qiita.com/MOhhh-ok/items/04f7e57e303bb0b8ebe8

      const String subDir = "data";
      final path = join(Directory.current.path, subDir);
      Directory(path).create();
      sqfliteFfiInit();
      final options = OpenDatabaseOptions(
          version: _databaseVersion,
          onCreate: _onCreate,
          onConfigure: _onConfigure);
      return await databaseFactoryFfi.openDatabase(path, options: options);
    } else {
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String path =
          join(documentDirectory.path, DatabaseClient._databaseFileName);

      // SQLiteクライアントでアクセスしたい時は、ここで出力される
      // ファイルパスを使う。
      print("database path : $path");

      // DBをリセットしたいときに、ここのコメントを外して起動する
      // var file = File(path);
      // var exists = await file.exists();
      // if (exists) {
      //   print('ゼロから作るためDBを削除1');
      //   await file.delete();
      //   print('ゼロから作るためDBを削除2');
      // }

      return await openDatabase(path,
          version: _databaseVersion,
          onCreate: _onCreate,
          onConfigure: _onConfigure);
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(_createQuizzesTableString);
    await db.execute(_createChaptersTableString);
    await db.execute(_createCompletedQuizzesTableString);
    await db.execute(_createCompletedChaptersTableString);
    await db.execute(_insertQuizzesString);
    await db.execute(_insertChaptersString);
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}

const String _createQuizzesTableString = '''
  CREATE TABLE IF NOT EXISTS $QUIZZES_TABLE_NAME(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL
  );
''';

const String _createChaptersTableString = '''
  CREATE TABLE IF NOT EXISTS $CHAPTERS_TABLE_NAME(
    id INTEGER PRIMARY KEY,
    quiz_id INTEGER NOT NULL,
    sort_order INTEGER NOT NULL,
    hint TEXT NOT NULL,
    question TEXT NOT NULL,
    comment TEXT NOT NULL,
    image_path TEXT NOT NULL,
    correct_area_x INTEGER NOT NULL,
    correct_area_y INTEGER NOT NULL,
    correct_area_width INTEGER NOT NULL,
    correct_area_height INTEGER NOT NULL,

    FOREIGN KEY (quiz_id) references quizzes(id)
  );
''';

const String _createCompletedQuizzesTableString = '''
  CREATE TABLE IF NOT EXISTS $COMPLETED_QUIZZES_TABLE_NAME(
    quiz_id INTEGER NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

    PRIMARY KEY (quiz_id),
    FOREIGN KEY (quiz_id) references quizzes(id)
  );
''';

const String _createCompletedChaptersTableString = '''
  CREATE TABLE IF NOT EXISTS $COMPLETED_CHAPTERS_TABLE_NAME(
    quiz_id INTEGER NOT NULL,
    chapter_id INTEGER NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

    PRIMARY KEY (quiz_id, chapter_id),
    FOREIGN KEY (quiz_id) references quizzes(id),
    FOREIGN KEY (chapter_id) references chapters(id)
  );
''';

const String _insertQuizzesString = '''
  INSERT INTO quizzes
    (id, title)
  VALUES
    (1, 'まさか・・・'),
    (2, 'なんで・・・');
''';

const String _insertChaptersString = '''
  /* チャプターのマスターデータを挿入 */
  INSERT INTO chapters(
    id, quiz_id, sort_order, hint, question, comment,
    image_path, correct_area_x, correct_area_y,
    correct_area_width, correct_area_height
  )
  VALUES
    (
      1, 1, 1, 'まさかのヒント1',
      'まさかの問題文1', 'まさかのコメント1', 'assets/images/quizzes/1',
      10, 10, 100, 100
    ),
    (
      2, 1, 2, 'まさかのヒント2',
      'まさかの問題文2', 'まさかのコメント2', 'assets/images/quizzes/1',
      30, 20, 100, 150
    ),
    (
      3, 1, 3, 'まさかのヒント3',
      'まさかの問題文3', 'まさかのコメント3', 'assets/images/quizzes/1',
      70, 30, 80, 100
    ),
    (
      4, 1, 4, 'まさかのヒント4',
      'まさかの問題文4', 'まさかのコメント4', 'assets/images/quizzes/1',
      90, 40, 80, 80
    ),
    (
      5, 2, 1, 'なんでのヒント1',
      'なんでの問題文1', 'なんでのコメント1', 'assets/images/quizzes/2',
      10, 10, 100, 100
    ),
    (
      6, 2, 2, 'なんでのヒント2',
      'なんでの問題文2', 'なんでのコメント2', 'assets/images/quizzes/2',
      30, 20, 100, 150
    ),
    (
      7, 2, 3, 'なんでのヒント3',
      'なんでの問題文3', 'なんでのコメント3', 'assets/images/quizzes/2',
      70, 30, 80, 100
    ),
    (
      8, 2, 4, 'なんでのヒント4',
      'なんでの問題文4', 'なんでのコメント4', 'assets/images/quizzes/2',
      90, 40, 80, 80
    );
''';
