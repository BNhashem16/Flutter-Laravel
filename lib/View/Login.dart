import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hashem_laravel/Controllers/DatabaseHelpers.dart';
import 'package:hashem_laravel/View/Register.dart';
import 'package:hashem_laravel/View/AddData.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final databaseHelper = DatabaseHelper();
  String msgStatus = '';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _onPressed() {
    setState(() {
      var email = _emailController.text.trim().toLowerCase();
      var password = _passwordController.text.trim();

      if (email.isNotEmpty && password.isNotEmpty) {
        databaseHelper.login(email, password).whenComplete(() {
          if (databaseHelper.status == 'error') {
            _showDialog(databaseHelper.message);
          } else {
            Navigator.pushNamed(context, '/dashboard');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Place your email',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Place your password',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: _onPressed,
                  color: Colors.blue,
                  child: new Text(
                    'Login',
                    style: new TextStyle(
                        color: Colors.white, backgroundColor: Colors.blue),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new Text(
                  '$msgStatus',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
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
