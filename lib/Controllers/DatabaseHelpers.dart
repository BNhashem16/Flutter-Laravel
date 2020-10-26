import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = 'http://167.71.6.214/~hashem/flutter_laravel/public/api';
  var status;
  var token;
  var message;

  // Login Data
   login(String email , String password) async {
    String myUrl = "$serverUrl/login";
    final response = await http.post(myUrl ,
        headers: {
          'Accept' : 'application/json',
        },
        body: {
          'email' : "$email",
          'password' : "$password",
        });

    Map mapValues =  json.decode(response.body);
    status = mapValues['status'];
    message = mapValues['message'];
    if(mapValues['status'] == "error"){
      print('THE MESSAGE: ${mapValues['message']}');
    }else{
      print('Congrats : ${mapValues['message']}');
      print('UR TOKEN IS : ${mapValues['item']['token']}');
      _Save(mapValues['item']['token']);
    }
  }

  // Register Data
   register(String email , String name , String password) async {
    String myUrl = "$serverUrl/register";
    final response = await http.post(myUrl ,
        headers: {
          'Accept' : 'application/json',
        },
        body: {
          'name'      :  "$name",
          'email'     :  "$email",
          'password'  :  "$password",
        });

    Map mapValues =  json.decode(response.body);
    status = mapValues['status'];
    message = mapValues['message'];
    if(mapValues['status'] == "error"){
      print('THE MESSAGE: ${mapValues['message']}');
    }else{
      print('Congrats : ${mapValues['message']}');
      print('UR TOKEN IS : ${mapValues['item']['token']}');
      _Save(mapValues['item']['token']);
    }
  }

  // Fetch Data
  Future <List> getData() async{
    var TOKEN = Read();
    String myUrl = "$serverUrl/products/";
    http.Response response = await http.get(myUrl ,
        headers: {
          'Accept' : 'application/json',
          'Authorization' : 'Bearer $TOKEN',
        });
    return json.decode(response.body);
  }

  // Fetch Data
  void deleteData(int id) async {
    var TOKEN = Read();
    String myUrl = '$serverUrl/products/$id/destroy';
    http.post(myUrl ,
        headers: {
          'Accept' : 'application/json',
          'Authorization' : 'Bearer $TOKEN',
        }).then((response) {
      print('Response Status : ${response.statusCode}');
      print('Response Body : ${response.body}');
    });
  }

  // Add Data
   addData(String name , String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    String myUrl = '$serverUrl/products/store';
     final response = await  http.post(myUrl ,
        headers: {
          'Accept' : 'application/json',
          'Authorization' : 'Bearer $value',
        },
        body: {
          'name' : "$name",
          'price' : "$price",
        });
    Map mapValues =  json.decode(response.body);
    status = mapValues['status'];
    message = mapValues['message'];
  }


  // Edit Data
  void editData(int id , String name , String price) async {
    var TOKEN = Read();
    String myUrl = '$serverUrl/products/$id/update';
    http.post(myUrl ,
        headers: {
          'Accept' : 'application/json',
          'Authorization' : 'Bearer $TOKEN',
        },
        body: {
          'name' : 'سيدك وتاج رأسك أحمد هاشم يا إيمان الجزمة',
          'price' : '7000000',
        }).then((response) {
      print('Response Status : ${response.statusCode}');
      print('Response Body : ${response.body}');
    });
  }

  _Save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  Read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    return value;
  }
}