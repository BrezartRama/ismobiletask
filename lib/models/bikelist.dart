import 'bike.dart';

class BikeList {
  final List<Bike> bikes;

  BikeList({
    this.bikes,
  });

  BikeList.fromJson(List<dynamic> parsedJson) :
    bikes = parsedJson.map((i)=>Bike.fromJson(i)).toList();
  
}