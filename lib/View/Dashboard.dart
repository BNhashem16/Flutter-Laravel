import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Controllers/DatabaseHelpers.dart';
import './Register.dart';
import './AddData.dart';
import './ShowData.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                (Navigator.pushNamed(context, '/register'));
              },
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () => (Navigator.pushNamed(context, '/adddata')),
        ),
        body: FutureBuilder<List>(
          future: databaseHelper.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(list: snapshot.data)
                : Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Let the ListView know how many list it needs to build.
      itemCount: list == null ? 0 : list.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = list[index];
        print(item);
        return Container(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShowData(list: list, index: index),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(list[index]['name']),
                leading: Icon(Icons.apps),
                subtitle: Text('Price : ${list[index]['price']}'),
              ),
            ),
          ),
        );

        // return ListTile(
        //   title: item.buildTitle(context),
        //   subtitle: item.buildSubtitle(context),
        // );
      },
    );
  }
}