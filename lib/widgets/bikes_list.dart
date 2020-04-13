import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ismobiletask/providers/bikes_provider.dart';
import 'package:ismobiletask/widgets/bike_item.dart';
import 'package:provider/provider.dart';

class BikesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //List<Bike> bikes;
    //var bikes = Provider.of<List<Bike>>(context);
    // var provider  = Provider.of<BikesProvider>(context).loadBikes();
    // provider.then((onValue)=>{
    //   bikes = onValue,
    //   print(bikes),

    // });

    // provider.deleteBike(bikes[1].id);
    //provider.deleteTableContent();
    // print('THIS ARE BIKES '+bikes.toString());
    //print(bikes.length);

    final bikesData = Provider.of<BikesProvider>(context);
    final bikes = bikesData.items;


    if (bikes == null) {
      print('Bikes are null so we return ');
      //  Return a cointainer that saus "Loading...."
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
