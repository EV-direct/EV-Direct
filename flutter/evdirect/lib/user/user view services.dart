import 'dart:convert';
import 'package:evdirect/user/userhome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_newtemp.dart';

void main() {
  runApp(const UserViewServices());
}

class UserViewServices extends StatelessWidget {
  const UserViewServices({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const viewservicePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class viewservicePage extends StatefulWidget {
  const viewservicePage({super.key, required this.title});



  final String title;

  @override
  State<viewservicePage> createState() => _UserviewservicePageState();
}

class _UserviewservicePageState extends State<viewservicePage> {
  _UserviewservicePageState(){
    get_data();

  }

  List<String> id_=<String>[];
  List<String> service_=<String>[];

  Future<void> get_data() async {
    List<String> id = <String>[];
    List<String> service = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String wid = sh.getString('wid').toString();
      String url = '$urls/usr_view_services/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'wid':wid,

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        service.add(arr[i]['service']);

      }

      setState(() {
        id_ = id;
        service_=service;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }



  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton( color: Colors.white,),

          backgroundColor: Theme.of(context).colorScheme.primary,

          title: Text("Services", style: TextStyle(color: Colors.white),),
        ),
        body:ListView.builder(
          physics: BouncingScrollPhysics(),
          // padding: EdgeInsets.all(5.0),
          // shrinkWrap: true,
          itemCount: id_.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onLongPress: () {
                print("long press" + index.toString());
              },
              title: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        child: Card(
                          elevation: 6,
                          margin: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Service ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),Text(
                                      service_[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {

                                          // final pref =await SharedPreferences.getInstance();
                                          // pref.setString("wid", id_[index]);
                                          //

                                          SharedPreferences sh = await SharedPreferences.getInstance();
                                          String url = sh.getString('url').toString();

                                          final urls = Uri.parse('$url/usr_book_services/');
                                          try {

                                            final response = await http.post(urls, body: {
                                              "sid":id_[index],
                                              'lid':sh.getString('lid').toString()

                                            });
                                            if (response.statusCode == 200) {
                                              String status = jsonDecode(response.body)['status'];
                                              if (status=='ok') {

                                                Fluttertoast.showToast(msg: 'Booking Successfully');
                                                Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) => MyUserHomePage(title: "home"),));
                                              }else {
                                                Fluttertoast.showToast(msg: 'Not Found');
                                              }
                                            }
                                            else {
                                              Fluttertoast.showToast(msg: 'Network Error');
                                            }
                                          }
                                          catch (e){
                                            Fluttertoast.showToast(msg: e.toString());
                                          }

                                        },
                                        child: Text("Book"),
                                      ),

                                    ]
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
        // ListView.builder(
        //   physics: BouncingScrollPhysics(),
        //   // padding: EdgeInsets.all(5.0),
        //   // shrinkWrap: true,
        //   itemCount: id_.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       onLongPress: () {
        //         print("long press" + index.toString());
        //       },
        //       title: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             children: [
        //               Card(
        //                 child:
        //                 Row(
        //                     children: [
        //                       Column(
        //                         children: [
        //                           Padding(
        //                             padding: EdgeInsets.all(5),
        //                             child: Text(service_[index]),
        //                           ),
        //                           Padding(
        //                             padding: EdgeInsets.all(5),
        //                             child: Row(
        //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                               children: [
        //                                 ElevatedButton(
        //                                   onPressed: () async {
        //
        //                                     // final pref =await SharedPreferences.getInstance();
        //                                     // pref.setString("wid", id_[index]);
        //                                     //
        //
        //     SharedPreferences sh = await SharedPreferences.getInstance();
        //     String url = sh.getString('url').toString();
        //
        //     final urls = Uri.parse('$url/usr_book_services/');
        //     try {
        //
        //     final response = await http.post(urls, body: {
        //     "sid":id_[index],
        //     'lid':sh.getString('lid').toString()
        //
        //     });
        //     if (response.statusCode == 200) {
        //     String status = jsonDecode(response.body)['status'];
        //     if (status=='ok') {
        //
        //     Fluttertoast.showToast(msg: 'Booking Successfully');
        //     Navigator.push(context, MaterialPageRoute(
        //     builder: (context) => userhomepage(title: "home"),));
        //     }else {
        //     Fluttertoast.showToast(msg: 'Not Found');
        //     }
        //     }
        //     else {
        //     Fluttertoast.showToast(msg: 'Network Error');
        //     }
        //     }
        //     catch (e){
        //     Fluttertoast.showToast(msg: e.toString());
        //     }
        //
        //                                   },
        //                                   child: Text("Booking"),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //
        //                         ],
        //                       ),
        //
        //                     ]
        //                 ),
        //
        //                 elevation: 8,
        //                 margin: EdgeInsets.all(10),
        //               ),
        //             ],
        //           )),
        //     );
        //   },
        // ),

      ),
    );
  }
}
