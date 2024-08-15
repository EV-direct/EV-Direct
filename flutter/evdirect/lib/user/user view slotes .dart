import 'dart:convert';

import 'package:evdirect/user/userhome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home_newtemp.dart';


void main() {
  runApp(const Userviewslotes());
}

class Userviewslotes extends StatelessWidget {
  const Userviewslotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserviewslotesPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class UserviewslotesPage extends StatefulWidget {
  const UserviewslotesPage({super.key, required this.title});



  final String title;

  @override
  State<UserviewslotesPage> createState() => _UserviewslotesPageState();
}

class _UserviewslotesPageState extends State<UserviewslotesPage> {



  _UserviewslotesPageState(){
    get_data();
  }
  List<String> id_=<String>[];
  List<String> date_=<String>[];
  List<String> charges_=<String>[];
  List<String> free_slot_=<String>[];
  List<String> unit_=<String>[];

  Future<void> get_data() async {
    List<String> id = <String>[];
    List<String> date = <String>[];
    List<String> charges = <String>[];
    List<String> free_slot = <String>[];
    List<String> unit = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String evid = sh.getString('evid').toString();
      String url = '$urls/usr_view_slots/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'evid':evid,

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        date.add(arr[i]['date']);
        charges.add(arr[i]['charges']);
        free_slot.add(arr[i]['free_slot']);
        unit.add(arr[i]['unit']);

      }

      setState(() {
        id_ = id;
        date_=date;
        charges_=charges;
        free_slot_=free_slot;
        unit_=unit;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }


  void _incrementCounter() {
    setState(() {


    });
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

          title: Text("Slots", style: TextStyle(color: Colors.white),),
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
                                      "Date ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),Text(
                                      date_[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ],
                                ),Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Charge ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),Text(
                                      charges_[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ],
                                ),Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Free Slot ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),Text(
                                      free_slot_[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ],
                                ),Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Unit ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),Text(
                                      unit_[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {

                                          // final pref =await SharedPreferences.getInstance();
                                          // pref.setString("wid", id_[index]);
                                          //

                                          SharedPreferences sh = await SharedPreferences.getInstance();
                                          String url = sh.getString('url').toString();

                                          final urls = Uri.parse('$url/usr_book_slots/');
                                          try {

                                            final response = await http.post(urls, body: {
                                              "slid":id_[index],
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
                                        child: Text("Book slot"),
                                      ),
                                    ],
                                  ),
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
        //                             child: Text(date_[index]),
        //                           ),
        //                           Padding(
        //                             padding: EdgeInsets.all(5),
        //                             child: Text(charges_[index]),
        //                           ),Padding(
        //                             padding: EdgeInsets.all(5),
        //                             child: Text(free_slot_[index]),
        //                           ),Padding(
        //                             padding: EdgeInsets.all(5),
        //                             child: Text(unit_[index]),
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
        //                                     SharedPreferences sh = await SharedPreferences.getInstance();
        //                                     String url = sh.getString('url').toString();
        //
        //                                     final urls = Uri.parse('$url/usr_book_slots/');
        //                                     try {
        //
        //                                       final response = await http.post(urls, body: {
        //                                         "slid":id_[index],
        //                                         'lid':sh.getString('lid').toString()
        //
        //                                       });
        //                                       if (response.statusCode == 200) {
        //                                         String status = jsonDecode(response.body)['status'];
        //                                         if (status=='ok') {
        //
        //                                           Fluttertoast.showToast(msg: 'Booking Successfully');
        //                                           Navigator.push(context, MaterialPageRoute(
        //                                             builder: (context) => MyUserHomePage(title: "home"),));
        //                                         }else {
        //                                           Fluttertoast.showToast(msg: 'Not Found');
        //                                         }
        //                                       }
        //                                       else {
        //                                         Fluttertoast.showToast(msg: 'Network Error');
        //                                       }
        //                                     }
        //                                     catch (e){
        //                                       Fluttertoast.showToast(msg: e.toString());
        //                                     }
        //
        //                                   },
        //                                   child: Text("Book slot"),
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
