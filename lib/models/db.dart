import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> connectDB() async {
  return openDatabase(
    join(await getDatabasesPath(), 'remind_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE events(id INTEGER AUTOINCREMENT PRIMARY KEY, name TEXT, time TEXT)',
      );
    },
    version: 1,
  );
}
