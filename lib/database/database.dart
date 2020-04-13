import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BikesDatabase {

  Future<Database> openConnection() async {
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      join(await getDatabasesPath(), 'bikes_database.db'),
      // When the database is first created, create a table to store bikes.
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE bikes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            frame_size TEXT,
            category TEXT,
            location TEXT,
            name TEXT,
            photo_url TEXT,
            price_range TEXT,
            description TEXT
          )''',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    return database;
  }
}
