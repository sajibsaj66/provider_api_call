import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'data_model.dart';



Future<List<DataModelNew>?> getSinglePostData() async{
  var client = http.Client();

  var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await client.get(uri);
  if (response.statusCode == 200) {
    var json = response.body;
    return userFromJson(json);
  }
  return null;
}
