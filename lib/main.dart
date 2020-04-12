import 'package:flutter/material.dart';
import 'package:ismobiletask/screens/bike_detail.dart';
import 'package:ismobiletask/screens/homepage.dart';
import 'package:provider/provider.dart';

import 'providers/bikes_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (_) => BikesProvider()),
        FutureProvider(create: (_) => BikesProvider().loadBike()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.white),
        home: HomePage(),
        routes: {
          BikeDetailScreen.routeName: (ctx) => BikeDetailScreen(),
        },
      ),
    );
  }
}
