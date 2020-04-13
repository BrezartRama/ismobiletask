import 'package:flutter/material.dart';
import 'package:ismobiletask/models/bike.dart';
import 'package:ismobiletask/providers/bikes_provider.dart';
import 'package:ismobiletask/screens/homepage.dart';
import 'package:provider/provider.dart';

class EditBikeScreen extends StatelessWidget {
  static const routeName = '/bike-edit';
  static final _formKey = GlobalKey<FormState>();
  String name, category, frameSize, priceRange, location, description;

  @override
  Widget build(BuildContext context) {
    final bikeId = ModalRoute.of(context).settings.arguments;
    final loadedBike = Provider.of<BikesProvider>(context)
        .items
        .firstWhere((bike) => bike.id == bikeId);
    var provider = Provider.of<BikesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bike'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              TextFormField(
                initialValue: loadedBike.name,
                decoration: InputDecoration(
                  labelText: 'Bike Name',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  hintText: 'Enter Bike Name',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen)),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (input) =>
                    input.length == 0 ? 'Please enter Name' : null,
                onSaved: (val) => name = val,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: loadedBike.category,
                decoration: InputDecoration(
                  labelText: 'Bike Category',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  hintText: 'Enter Category',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen)),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (input) =>
                    input.length == 0 ? 'Please enter Category' : null,
                onSaved: (val) => category = val,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: loadedBike.frameSize,
                decoration: InputDecoration(
                  labelText: 'Bike FrameSize',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  hintText: 'Enter Frame Size',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen)),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (input) =>
                    input.length == 0 ? 'Please enter FrameSize' : null,
                onSaved: (val) => frameSize = val,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: loadedBike.priceRange,
                decoration: InputDecoration(
                  labelText: 'Bike Price Range',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  hintText: 'Enter Price Range',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (input) =>
                    input.isEmpty ? 'Please enter PriceRange' : null,
                onSaved: (val) => priceRange = val,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: loadedBike.location,
                decoration: InputDecoration(
                  labelText: 'Bike Location',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  hintText: 'Enter Location',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen)),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (input) =>
                    input.length == 0 ? 'Please enter Locarion' : null,
                onSaved: (val) => location = val,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: loadedBike.description,
                decoration: InputDecoration(
                  labelText: 'Bike Description',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  hintText: 'Enter Description',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen)),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (input) =>
                    input.length == 0 ? 'Please enter Description' : null,
                onSaved: (val) => description = val,
              ),
              new Container(
                padding:
                    const EdgeInsets.only(left: 90.0, top: 20.0, right: 90.0),
                child: new RaisedButton(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    print('submit FOrm');
                    final FormState form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      Bike bike = Bike.fromMap({
                        "id": loadedBike.id,
                        "frameSize": frameSize,
                        "category": category,
                        "location": location,
                        "name": name,
                        "photoUrl":
                            "https://images.internetstores.de/products//1064879/02/e7386b/Cube_Acid_Hybrid_One_500_Allroad_Trapez_black_n_green[640x480].jpg?forceSize=true&forceAspectRatio=true&useTrim=true",
                        "priceRange": priceRange,
                        "description": description
                      });

                      provider.updateBike(bike);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
