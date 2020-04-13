import 'package:flutter/material.dart';
import 'package:ismobiletask/screens/add_bike.dart';
import 'package:ismobiletask/screens/bike_detail.dart';
import 'package:ismobiletask/screens/edit_bike.dart';
import 'package:ismobiletask/screens/homepage.dart';
import 'package:provider/provider.dart';

import 'providers/bikes_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
     MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BikesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.white),
        home: HomePage(),
        routes: {
          BikeDetailScreen.routeName: (ctx) => BikeDetailScreen(),
          AddBikeScreen.routeName: (ctx)=> AddBikeScreen(), 
          EditBikeScreen.routeName:(ctx)=> EditBikeScreen(),
          HomePage.routeName:(ctx)=>HomePage(),
        },
      ),
    );
  }
}
