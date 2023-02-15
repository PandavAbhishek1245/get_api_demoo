import 'dart:convert';
import 'package:get/get.dart';

import '../modelclass/user_data_model.dart';
import 'package:http/http.dart'as http;

class FristScreenController  extends GetxController{

  var model = modelclass().obs;

  getapicaling()async{
    var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2/"));
    // print("${response.body} ");
    if(response.statusCode==200){
      var jsonDecodeResponse = await jsonDecode(response.body);
      model.value = modelclass.fromJson(jsonDecodeResponse);

    }
  }

}