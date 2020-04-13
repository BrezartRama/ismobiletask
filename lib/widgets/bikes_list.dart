import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ismobiletask/providers/bikes_provider.dart';
import 'package:ismobiletask/widgets/bike_item.dart';
import 'package:provider/provider.dart';

class BikesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bikesData = Provider.of<BikesProvider>(context);
    final bikes = bikesData.items;

    if (bikes == null) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            'Is Loading...',
            style: TextStyle(
                fontSize: 20, color: Colors.black, letterSpacing: 1.2),
          ),
        ),
      );
    }
    return
        //Container(height: 50, width: 50, child: Text('Loading'),);
        ListView.builder(
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
