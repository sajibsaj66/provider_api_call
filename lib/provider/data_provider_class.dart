import 'package:flutter/material.dart';
import 'package:provider_api_call/provider/service_class.dart';
import 'data_model.dart';

class DataClass extends ChangeNotifier {
  //DataModel? post;
 List <DataModelNew>? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getSinglePostData());
    loading = false;
    notifyListeners();
  }
}
