import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_api_demoo/controller/frist_screen_controller.dart';
import 'package:get_api_demoo/modelclass/user_data_model.dart';
import 'package:get_api_demoo/single_user.dart';
import 'package:http/http.dart' as http;

class FristScreen extends StatefulWidget {
  const FristScreen({Key? key}) : super(key: key);

  @override
  State<FristScreen> createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  var modell = Get.put(FristScreenController());

  // var model = modelclass();
  @override
  void initState() {
    // TODO: implement initState
    modell.getapicaling();
    super.initState();
  }

  // getapicaling()async{
  //   var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2/"));
  //   // print("${response.body} ");
  //   if(response.statusCode==200){
  //     var jsonDecodeResponse = await jsonDecode(response.body);
  //     model = modelclass.fromJson(jsonDecodeResponse);
  //     setState(() {
  //
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => modell.model.value.data==null
          ?Center()
          :ListView.separated(
        itemCount: modell.model.value.data!.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder:(context)=>SingleUser(id: modell.model.value.data![index].id!.toString(),)));
            },
            child: Card(
                child: ListTile(
                  title: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: NetworkImage(modell.model.value.data![index].avatar.toString()),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(modell.model.value.data![index].firstName!,style: TextStyle(fontSize: 20,),),
                          Text(modell.model.value.data![index].lastName!),
                          Text(modell.model.value.data![index].email!),
                          Text(modell.model.value.data![index].id.toString()),

                          // Container(
                          //     color: Colors.blue,
                          //     child: GestureDetector(
                          //         onTap: (){
                          //           Get.changeTheme(Get.isDarkMode? ThemeData.dark(): ThemeData.light());
                          //
                          //         },
                          //         child: Text("ssfdsf"))),

                        ],
                      )
                    ],
                  ),
                )
            ),
          );
        }, separatorBuilder: (context,index){return SizedBox(height: 10,);},),

      ),
    );
  }
}
