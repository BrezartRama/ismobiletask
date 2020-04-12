import 'package:flutter/material.dart';
import 'package:ismobiletask/widgets/bikes_list.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('InternetStores Bikes'),
      ),
      body: BikesList(),
    );
  }
}
