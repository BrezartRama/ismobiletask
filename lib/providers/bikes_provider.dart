import 'package:flutter/material.dart';
import 'package:ismobiletask/database/database.dart';
import 'package:ismobiletask/models/bike.dart';
import 'dart:async' show Future;
import 'package:sqflite/sqflite.dart';

class BikesProvider with ChangeNotifier {
  List<Bike> _items = [];

  List<Bike> get items {
    return [..._items];
  }

  /// Method addBike is used to insert a bike into sqlite database.. First
  /// we get the reference to the database we get the bike as an argument from the method and insert it

  Future<void> addBike(Bike bike) async {
    // Get a reference to the database.
    final BikesDatabase bikedDbHelper = new BikesDatabase();
    final Database db = await bikedDbHelper.openConnection();

    // Insert the Bike into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'bikes',
      bike.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  /// Method loadBikes is used to get all the bikes from the database using future which is async and
  /// then add those bike to our List of bikes because we later use it to fetch our UI with data

  Future<void> loadBikes() async {
    _items = new List<Bike>();
    // Get a reference to the database.
    final BikesDatabase bikedDbHelper = new BikesDatabase();
    final Database db = await bikedDbHelper.openConnection();

    // Query the table for all The Bikes.
    final List<Map<String, dynamic>> maps = await db.query('bikes');

    // Convert the List<Map<String, dynamic> into a List<Bikes>.
    List.generate(maps.length, (i) {
      Bike bike = Bike(
          id: maps[i]['id'],
          frameSize: maps[i]['frame_size'],
          category: maps[i]['category'],
          location: maps[i]['location'],
          name: maps[i]['name'],
          imageUrl: maps[i]['photo_url'],
          priceRange: maps[i]['price_range'],
          description: maps[i]['description']);
      _items.add(bike);
    });
    notifyListeners();
  }

  ///Method updateBike is used to update a bike into database, it accepts a bike as an argument and then
  ///we get the reference to the database and update our given bike 

  Future<void> updateBike(Bike bike) async {
    // Get a reference to the database.
    final BikesDatabase bikedDbHelper = new BikesDatabase();
    final Database db = await bikedDbHelper.openConnection();

    // Update the given Dog.
    await db.update(
      'bikes',
      bike.toMap(),
      // Ensure that the Bike has a matching id.
      where: "id = ?",
      // Pass the Bike's id as a whereArg to prevent SQL injection.
      whereArgs: [bike.id],
    );
    notifyListeners();
  }

  /// Method deleteBike is used to delete a bike from the database. methods accepts an integer
  /// as an argument to find the Bike according to that Id and then delete that bike.
  Future<void> deleteBike(int id) async {
    // Get a reference to the database.
    final BikesDatabase bikedDbHelper = new BikesDatabase();
    final Database db = await bikedDbHelper.openConnection();

    // Remove the Bike from the database.
    await db.delete(
      'bikes',
      // Use a `where` clause to delete a specific bike.
      where: "id = ?",
      // Pass the Bike's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    notifyListeners();
  }
}
