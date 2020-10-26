import 'package:flutter/material.dart';
import './View/AddData.dart';
import './View/Dashboard.dart';
import './View/EditData.dart';
import './View/Login.dart';
import './View/Register.dart';
import './View/ShowData.dart';
import './View/EditData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title ='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD',
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: LoginPage(title : 'Flutter CRUD'),
      routes: <String , WidgetBuilder>{
        '/dashboard'    :  (context) => Dashboard(),
        '/adddata'      :  (context) => AddData(),
        '/register'     :  (context) => RegisterPage(),
        '/login'        :  (context) => LoginPage(),
        '/showdata'     :  (context) => ShowData(),
        '/editdata'     :  (context) => EditData(),
      },
    );
  }
}
