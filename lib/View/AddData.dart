import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hashem_laravel/Controllers/DatabaseHelpers.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddData extends StatefulWidget{

  AddData({Key key , this.title}) : super(key : key);
  final String title;
  @override
  AddDataState  createState() => AddDataState();
}

class AddDataState extends State<AddData> {
  final databaseHelper = DatabaseHelper();
  final  _nameController = new TextEditingController();
  final  _priceController = new TextEditingController();
  _storeProduct() {
    setState(() {
      String name = _nameController.text.trim();
      String price = _priceController.text.trim();
      if (name.isNotEmpty && price.isNotEmpty ) {
        databaseHelper.addData(name , price).whenComplete(() {
          if (databaseHelper.status == 'success') {
            Navigator.pushNamed(context, '/adddata');
          } else {
            _showDialog(databaseHelper.message);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Product',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Add Product'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Product Name',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: new TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    hintText: 'Place your price',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: _storeProduct,
                  color: Colors.blue,
                  child: new Text(
                    'Add',
                    style: new TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.blue),),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }


  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text(message),
            actions: <Widget>[
              new RaisedButton(
                child: new Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }


}
