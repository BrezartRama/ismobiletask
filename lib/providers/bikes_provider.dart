import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ismobiletask/models/bike.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:ismobiletask/models/bikelist.dart';

class BikesProvider with ChangeNotifier {

  List<Bike> bikelist;
  List<Bike> _items;
  final String _dataPath ='assets/isbikesdata.json';

  

  Future<List<Bike>> loadBike() async {
    var dataString = await _loadBikeAsset();

    final jsonResponse = json.decode(dataString);

    _items = BikeList.fromJson(jsonResponse).bikes;

    return _items;
  }

  Future<String> _loadBikeAsset() async {
      return await rootBundle.loadString(_dataPath);
  }

  // Future<List<Bike>> get items async {
  //   await loadBike();
  //   return [..._items];
  // }
}
