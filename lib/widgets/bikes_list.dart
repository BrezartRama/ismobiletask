import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ismobiletask/models/bike.dart';
//import 'package:ismobiletask/providers/bikes_provider.dart';
import 'package:ismobiletask/widgets/bike_item.dart';
import 'package:provider/provider.dart';

class BikesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final bikesData = Provider.of<BikesProvider>(context);
    //final bikes = bikesData.items;
    var bikes = Provider.of<List<Bike>>(context);
    print('THIS ARE BIKES '+bikes.toString());
    if (bikes == null) {
      print('Bikes are null so we return ');
    }
    return bikes == null ? Container(height: 50, width: 50) : ListView.builder(
      itemCount: bikes.length,
      itemBuilder: (context, i) => BikeItem(
          bikes[i].id,
          bikes[i].name,
          bikes[i].category,
          bikes[i].frameSize,
          bikes[i].location,
          bikes[i].imageUrl),
    );
  }
}
