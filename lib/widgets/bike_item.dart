import 'package:flutter/material.dart';
import 'package:ismobiletask/providers/bikes_provider.dart';
import 'package:ismobiletask/screens/bike_detail.dart';
import 'package:ismobiletask/screens/edit_bike.dart';
import 'package:ismobiletask/screens/homepage.dart';
import 'package:provider/provider.dart';

class BikeItem extends StatelessWidget {
  final int id;
  final String name;
  final String category;
  final String frameSize;
  final String location;
  final String imageUrl;

  BikeItem(
    this.id,
    this.name,
    this.category,
    this.frameSize,
    this.location,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BikesProvider>(context);
    print('BikeItem Page ======');

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: Offset(
                10.0,
                10.0,
              ),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              BikeDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 80,
                top: 20,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 20,
                child: Container(
                  width: 350,
                  height: 150,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 230,
                width: MediaQuery.of(context).size.width - 60,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2),
                        ),
                        Text(
                          category,
                          style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              letterSpacing: 1.2),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2),
                        ),
                        Text(
                          frameSize,
                          style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2),
                        ),
                        Text(
                          location,
                          style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              letterSpacing: 1.2),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 40,
                              height: 40,
                              
                              child: IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.green,
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    EditBikeScreen.routeName,
                                    arguments: id,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  alignment: Alignment.topRight,
                                  onPressed: () {
                                    provider.deleteBike(id);
                                    
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
