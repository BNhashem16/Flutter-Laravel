import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hashem_laravel/Controllers/DatabaseHelpers.dart';
import 'package:hashem_laravel/View/Register.dart';
import 'package:hashem_laravel/View/AddData.dart';
import 'package:google_fonts/google_fonts.dart';
import '../View/EditData.dart';

class ShowData extends StatefulWidget {

  List list;
  int index;
  ShowData({this.index, this.list});
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  final databaseHelper = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          actions: [
            IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () =>  Navigator.pop(context, '/dashboard'),
            )
          ],
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new Text(
                  "Name : ${widget.list[widget.index]['name']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),

              Container(
                height: 50,
                child: new Text(
                  "Price : ${widget.list[widget.index]['price']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new Text(
                  "Created at : ${widget.list[widget.index]['created_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: new FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditData(list: widget.list , index: widget.index),
                          ),
                        );
                      },
                      color: Colors.green,
                      child: new Text(
                        'Edit',
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: new FlatButton(
                      onPressed: () {
                        databaseHelper.deleteData(widget.list[widget.index]['id']);
                        // Navigator.pushNamed(context, '/dashboard');
                        Navigator.of(context).pop('dashboard');
                      },
                      color: Colors.blue,
                      child: new Text(
                        'Delete',
                        style: new TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ],
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
