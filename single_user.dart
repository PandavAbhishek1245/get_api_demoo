import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api_demoo/modelclass/single_model.dart';
import 'package:http/http.dart' as http;

class SingleUser extends StatefulWidget {
  String? id;
  SingleUser({Key? key,this.id}) : super(key: key);

  @override
  State<SingleUser> createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  var single = SingleModel();
  List data = [];
  @override
  void initState() {
    // TODO: implement initState
    GetUser();
    super.initState();
  }

  GetUser()async{
    var response = await http.get(Uri.parse("https://reqres.in/api/users/${widget.id!}"));
    // print("${response.body} ");
    if(response.statusCode==200){
      var jsonDecodeResponse = await jsonDecode(response.body);
      single = SingleModel.fromJson(jsonDecodeResponse);
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: single!.data == null
          ? Center(child: CupertinoActivityIndicator())
          : Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(single!.data!.avatar!),
                    radius: 80,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                single!.data!.id!.toString(),
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              ),
              Text(
                single!.data!.firstName!,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                single!.data!.lastName!,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                single!.data!.email!,
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
