import 'package:flutter/material.dart';
import 'package:ismobiletask/providers/bikes_provider.dart';
import 'package:ismobiletask/screens/add_bike.dart';
import 'package:ismobiletask/widgets/bikes_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    print('Po hin qetu');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Qetu sdi ======');
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<BikesProvider>(context).loadBikes().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('InternetStores Bikes'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          :  BikesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Fab butoni osht shtyp');
          Navigator.pushNamed(context, AddBikeScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
