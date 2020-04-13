import 'package:flutter/material.dart';
import 'package:ismobiletask/providers/bikes_provider.dart';
import 'package:provider/provider.dart';

class BikeDetailScreen extends StatelessWidget {
  static const routeName = '/bike-detail';

  @override
  Widget build(BuildContext context) {
    final bikeId = ModalRoute.of(context).settings.arguments;
    final loadedBike = Provider.of<BikesProvider>(context).items
        .firstWhere((bike) => bike.id == bikeId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bike Details'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image.network(
                loadedBike.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 25, right: 8.0, bottom: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        loadedBike.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Category:  ',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: loadedBike.category,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontStyle: FontStyle.italic))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'FrameSize:  ',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: loadedBike.frameSize,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontStyle: FontStyle.italic))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'PriceRange:  ',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: loadedBike.priceRange,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontStyle: FontStyle.italic))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Location:  ',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: loadedBike.location,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontStyle: FontStyle.italic))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        loadedBike.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
