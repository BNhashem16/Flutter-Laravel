import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() async {
  List data = await getData();
  print(data);

  // Store Data
  // addData();
  // Edit Data
  // editData();
  // Delete Data
  // deleteData();
  //Login
  login();

  // Register
  // register();
  runApp(
      MaterialApp(
        title: 'Ahmed Hashem',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            backgroundColor: Colors.amber,
          ),
          body: Center(
            child: Text('Hashem'),
          ),
        ),
      )
  );
}

Future <List> getData() async{
  String myUrl = 'http://167.71.6.214/~hashem/flutter_laravel/public/api/products';
  http.Response response = await http.get(myUrl ,
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiN2E2N2NlYzI0ZTljMDRjZTY1OWNjNDZjY2YyYzdhZDM4YTRlMThhNmZiZmFmZmEzMDVkNjViNzk5NWI0MjUzZmFjMzFmZDExOWQ2M2EwZTYiLCJpYXQiOjE2MDM0NzM0NTYsIm5iZiI6MTYwMzQ3MzQ1NiwiZXhwIjoxNjM1MDA5NDU2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.odZlCgTBGom1VqpA_8qtvZLSJg-ACgdTRiAYnaLeZNC9AYfyompzZbuGwZmD69qDqFloNsk4kF8GaXnOsE6o2jyJ1LjD9eftXZJ2SmTN1wbYvJKdWcuRRTKKT5nd5gTJ9-a_jYW9IKMLQop2a8Ul302IoqR652J6TsjfnxB0UHQYMn1ZM4upOCjIMCJq7vo2QphGLf_Jhi_Kckbq4ecaqAyKwxHo8YHDFYZLg_KEi-41srOrRKRKCbWnVNp9TpBOL_xf006NO6RziyEWa0LA_R6MniwG7JNmD_ItGhN0TbNx92YZrUzLgd1UY4ID80FKXAezrZBJPAndVX6jqzjfSsHwLHzS7JPPD0X-3QWf8W6OLuJH0duutCBHzGiHH3DBgaDqms7-Py-4ctKZk93tnPagXxe0GeYW7m8v6nkRkUNiyesnGQFo9h7g3cBnhUF_Lp77Nm2Ah2x-IVzmIIDa7FQY6pzu32vNDnHbzQboLGE7oP58r1ZmV2m0zaV4pzBPCt-mwn7OiS71zjA0hzNdJAExGfzM2mFx77q3n5qyLCsppxKxdCUTkw7iauYp6fNiEhJIlkbUpHl0G73OMH2a_pg1O6XP4czGV7AJV3b4BtbEcnpHTBTQV5m8qtqMsS4iG9QoIj-EHdNS9EuB--TyNIUSl5bxQKRWeftUpcHWTzs',
      });
  return json.decode(response.body);
}

// Add Data
void addData() {
  String myUrl = 'http://167.71.6.214/~hashem/flutter_laravel/public/api/products/store';
  http.post(myUrl ,
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiN2E2N2NlYzI0ZTljMDRjZTY1OWNjNDZjY2YyYzdhZDM4YTRlMThhNmZiZmFmZmEzMDVkNjViNzk5NWI0MjUzZmFjMzFmZDExOWQ2M2EwZTYiLCJpYXQiOjE2MDM0NzM0NTYsIm5iZiI6MTYwMzQ3MzQ1NiwiZXhwIjoxNjM1MDA5NDU2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.odZlCgTBGom1VqpA_8qtvZLSJg-ACgdTRiAYnaLeZNC9AYfyompzZbuGwZmD69qDqFloNsk4kF8GaXnOsE6o2jyJ1LjD9eftXZJ2SmTN1wbYvJKdWcuRRTKKT5nd5gTJ9-a_jYW9IKMLQop2a8Ul302IoqR652J6TsjfnxB0UHQYMn1ZM4upOCjIMCJq7vo2QphGLf_Jhi_Kckbq4ecaqAyKwxHo8YHDFYZLg_KEi-41srOrRKRKCbWnVNp9TpBOL_xf006NO6RziyEWa0LA_R6MniwG7JNmD_ItGhN0TbNx92YZrUzLgd1UY4ID80FKXAezrZBJPAndVX6jqzjfSsHwLHzS7JPPD0X-3QWf8W6OLuJH0duutCBHzGiHH3DBgaDqms7-Py-4ctKZk93tnPagXxe0GeYW7m8v6nkRkUNiyesnGQFo9h7g3cBnhUF_Lp77Nm2Ah2x-IVzmIIDa7FQY6pzu32vNDnHbzQboLGE7oP58r1ZmV2m0zaV4pzBPCt-mwn7OiS71zjA0hzNdJAExGfzM2mFx77q3n5qyLCsppxKxdCUTkw7iauYp6fNiEhJIlkbUpHl0G73OMH2a_pg1O6XP4czGV7AJV3b4BtbEcnpHTBTQV5m8qtqMsS4iG9QoIj-EHdNS9EuB--TyNIUSl5bxQKRWeftUpcHWTzs',
      },
      body: {
        'name' : 'Ahmed Hashem',
        'price' : '1000000',
      }).then((response) {
    print('Response Status : ${response.statusCode}');
    print('Response Body : ${response.body}');
  });
}

// Edit Data
void editData() {
  int id = 13;
  String myUrl = 'http://167.71.6.214/~hashem/flutter_laravel/public/api/products/$id/update';
  http.post(myUrl ,
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiN2E2N2NlYzI0ZTljMDRjZTY1OWNjNDZjY2YyYzdhZDM4YTRlMThhNmZiZmFmZmEzMDVkNjViNzk5NWI0MjUzZmFjMzFmZDExOWQ2M2EwZTYiLCJpYXQiOjE2MDM0NzM0NTYsIm5iZiI6MTYwMzQ3MzQ1NiwiZXhwIjoxNjM1MDA5NDU2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.odZlCgTBGom1VqpA_8qtvZLSJg-ACgdTRiAYnaLeZNC9AYfyompzZbuGwZmD69qDqFloNsk4kF8GaXnOsE6o2jyJ1LjD9eftXZJ2SmTN1wbYvJKdWcuRRTKKT5nd5gTJ9-a_jYW9IKMLQop2a8Ul302IoqR652J6TsjfnxB0UHQYMn1ZM4upOCjIMCJq7vo2QphGLf_Jhi_Kckbq4ecaqAyKwxHo8YHDFYZLg_KEi-41srOrRKRKCbWnVNp9TpBOL_xf006NO6RziyEWa0LA_R6MniwG7JNmD_ItGhN0TbNx92YZrUzLgd1UY4ID80FKXAezrZBJPAndVX6jqzjfSsHwLHzS7JPPD0X-3QWf8W6OLuJH0duutCBHzGiHH3DBgaDqms7-Py-4ctKZk93tnPagXxe0GeYW7m8v6nkRkUNiyesnGQFo9h7g3cBnhUF_Lp77Nm2Ah2x-IVzmIIDa7FQY6pzu32vNDnHbzQboLGE7oP58r1ZmV2m0zaV4pzBPCt-mwn7OiS71zjA0hzNdJAExGfzM2mFx77q3n5qyLCsppxKxdCUTkw7iauYp6fNiEhJIlkbUpHl0G73OMH2a_pg1O6XP4czGV7AJV3b4BtbEcnpHTBTQV5m8qtqMsS4iG9QoIj-EHdNS9EuB--TyNIUSl5bxQKRWeftUpcHWTzs',
      },
      body: {
        'name' : 'سيدك وتاج رأسك أحمد هاشم يا إيمان الجزمة',
        'price' : '7000000',
      }).then((response) {
    print('Response Status : ${response.statusCode}');
    print('Response Body : ${response.body}');
  });
}

// Delete Data
void deleteData() {
  int id = 13;
  String myUrl = 'http://167.71.6.214/~hashem/flutter_laravel/public/api/products/$id/destroy';
  http.post(myUrl ,
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiN2E2N2NlYzI0ZTljMDRjZTY1OWNjNDZjY2YyYzdhZDM4YTRlMThhNmZiZmFmZmEzMDVkNjViNzk5NWI0MjUzZmFjMzFmZDExOWQ2M2EwZTYiLCJpYXQiOjE2MDM0NzM0NTYsIm5iZiI6MTYwMzQ3MzQ1NiwiZXhwIjoxNjM1MDA5NDU2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.odZlCgTBGom1VqpA_8qtvZLSJg-ACgdTRiAYnaLeZNC9AYfyompzZbuGwZmD69qDqFloNsk4kF8GaXnOsE6o2jyJ1LjD9eftXZJ2SmTN1wbYvJKdWcuRRTKKT5nd5gTJ9-a_jYW9IKMLQop2a8Ul302IoqR652J6TsjfnxB0UHQYMn1ZM4upOCjIMCJq7vo2QphGLf_Jhi_Kckbq4ecaqAyKwxHo8YHDFYZLg_KEi-41srOrRKRKCbWnVNp9TpBOL_xf006NO6RziyEWa0LA_R6MniwG7JNmD_ItGhN0TbNx92YZrUzLgd1UY4ID80FKXAezrZBJPAndVX6jqzjfSsHwLHzS7JPPD0X-3QWf8W6OLuJH0duutCBHzGiHH3DBgaDqms7-Py-4ctKZk93tnPagXxe0GeYW7m8v6nkRkUNiyesnGQFo9h7g3cBnhUF_Lp77Nm2Ah2x-IVzmIIDa7FQY6pzu32vNDnHbzQboLGE7oP58r1ZmV2m0zaV4pzBPCt-mwn7OiS71zjA0hzNdJAExGfzM2mFx77q3n5qyLCsppxKxdCUTkw7iauYp6fNiEhJIlkbUpHl0G73OMH2a_pg1O6XP4czGV7AJV3b4BtbEcnpHTBTQV5m8qtqMsS4iG9QoIj-EHdNS9EuB--TyNIUSl5bxQKRWeftUpcHWTzs',
      }).then((response) {
    print('Response Status : ${response.statusCode}');
    print('Response Body : ${response.body}');
  });
}

// Login Data
void login() {
  String myUrl = 'http://167.71.6.214/~hashem/flutter_laravel/public/api/login';
  http.post(myUrl ,
      headers: {
        'Accept' : 'application/json',
      },
      body: {
        'email' : 'hashem@gmail.com',
        'password' : '12345678',
      }).then((response) {
    // print('Response Status : ${response.statusCode}');
    // print('Response Body : ${response.body}');

    // Map mapValue = json.decode(response.body);
    // print('Token Value: ${mapValue.values.toString()}');

    Map mapValues =  json.decode(response.body);
    if(mapValues['status'] == "error"){
      print('THE MESSAGE: ${mapValues['message']}');
    }else{
      print('Congrats : ${mapValues['message']}');
      print('UR TOKEN IS : ${mapValues['item']['token']}');
    }
  });
}

// Register Data
void register() {
  String myUrl = 'http://167.71.6.214/~hashem/flutter_laravel/public/api/register';
  http.post(myUrl ,
      headers: {
        'Accept' : 'application/json',
      },
      body: {
        'name' : 'Hashomy',
        'email' : 'Hashomy@gmail.com',
        'password' : '12345678',
      }).then((response) {
    print('Response Status : ${response.statusCode}');
    print('Response Body : ${response.body}');

    Map mapValue = json.decode(response.body);
    print('Token Value: ${mapValue.values.toString()}');
  });
}