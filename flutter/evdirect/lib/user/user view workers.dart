
import 'dart:convert';
import 'package:evdirect/user/user%20chat%20with%20work.dart';
import 'package:evdirect/user/user%20view%20services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'user sent review about workers.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewWorkers(title: 'Flutter Demo Home Page'),
    );
  }
}

class ViewWorkers extends StatefulWidget {
  const ViewWorkers({super.key, required this.title});


  final String title;

  @override
  State<ViewWorkers> createState() => _ViewWorkersState();
}

class _ViewWorkersState extends State<ViewWorkers> {

  _ViewWorkersState() {
    view_notification();
  }

  List<String> worker_ = <String>[];
  List<String> id_ = <String>[];
  List<String> name_=<String>[];
  List<String> place_=<String>[];
  List<String> email_=<String>[];
  List<String> city_=<String>[];
  List<String> state_=<String>[];
  List<String> pin_=<String>[];
  List<String> photo_=<String>[];
  List<String> phone_=<String>[];
  List<String> category_=<String>[];
  List<String> gender_=<String>[];
  List<String> logid_=<String>[];



  Future<void> view_notification() async {
    List<String> worker = <String>[];
    List<String> id = <String>[];
    List<String> name=<String>[];
    List<String> place=<String>[];
    List<String> email=<String>[];
    List<String> city=<String>[];
    List<String> state=<String>[];
    List<String> pin=<String>[];
    List<String> photo=<String>[];
    List<String> phone=<String>[];
    List<String> category=<String>[];
    List<String> gender=<String>[];
    List<String> logid=<String>[];


    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String url = '$urls/usr_view_workers/';

      var data = await http.post(Uri.parse(url), body: {


      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        worker.add(arr[i]['worker'].toString());
        id.add(arr[i]['id'].toString());
        name.add(arr[i]['worker_name']);

        photo.add(sh.getString('img_url').toString()+ arr[i]['photo']);

        place.add(arr[i]['place']);
        email.add(arr[i]['email']);
        city.add(arr[i]['city']);
        state.add(arr[i]['state']);
        pin.add(arr[i]['pin']);
        phone.add(arr[i]['phone_number']);
        category.add(arr[i]['CATEGORY']);
        gender.add(arr[i]['gender']);
        logid.add(arr[i]['logid'].toString());
      }

      setState(() {
        worker_ = worker;
        id_ = id;
        name_=name;
        place_=place;
        email_=email;
        city_=city;
        state_=state;
        pin_=pin;
        photo_=photo;
        phone_=phone;
        category_=category;
        gender_=gender;
        logid_=logid;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton( color: Colors.white,),
            // TRY THIS: Try changing the color here to a specific color (to
            // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
            // change color while the other colors stay the same.
            backgroundColor: Theme.of(context).colorScheme.primary,

            title: Text("Workers", style: TextStyle(color: Colors.white),),
          ),
          body: ListView.builder(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(image: NetworkImage(photo_[index]),height: 200,width: 200,fit: BoxFit.fill,),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),Text(
                                        name_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Place ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),Text(
                                        place_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Email ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),Text(
                                        email_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "City",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),Text(
                                        city_[index],
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
                                        "State",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ), Text(
                                        state_[index],
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
                                        "Pin " ,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),Text(
                                        pin_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Phone ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),Text(
                                        phone_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Category ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),Text(
                                        category_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Gender",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),Text(
                                        gender_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () async {

                                            final pref =await SharedPreferences.getInstance();
                                            pref.setString("did", worker_[index]);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => UsersentreviewaboutworkersPage(title: '',)),
                                            );




                                          },
                                          child: Text("Review"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {

                                            final pref =await SharedPreferences.getInstance();
                                            pref.setString("wid", id_[index]);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => viewservicePage(title: '',)),
                                            );




                                          },
                                          child: Text("Services"),
                                        ),
                                        // ElevatedButton(
                                        //   onPressed: () async {
                                        //
                                        //     final pref =await SharedPreferences.getInstance();
                                        //     pref.setString("wid", logid_[index]);
                                        //
                                        //     Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(builder: (context) => MyChatPage(title: '',)),
                                        //     );
                                        //   },
                                        //   child: Text("Chat"),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 100,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {

                                          final pref =await SharedPreferences.getInstance();
                                          pref.setString("wid", logid_[index]);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyChatPage(title: '',)),
                                          );
                                        },
                                        child: Text("Chat"),
                                      ),
                                    ],
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
          //           child: Card(
          //             child:
          //             Row(
          //                 children: [
          //                   CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
          //                   Column(
          //                     children: [
          //                       Row(
          //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Text('Name'),
          //                           Text(name_[index]),
          //                         ],
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('Place'),
          //                             Text(place_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('Email'),
          //                             Text(email_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('City'),
          //                             Text(city_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('State'),
          //                             Text(state_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('Pin'),
          //                             Text(pin_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       // Padding(
          //                       //   padding: EdgeInsets.all(5),
          //                       //   child: Text(photo_[index]),
          //                       // ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('Phone'),
          //                             Text(phone_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('Category'),
          //                             Text(category_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('Gender'),
          //                             Text(gender_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             ElevatedButton(
          //                               onPressed: () async {
          //
          //                                 final pref =await SharedPreferences.getInstance();
          //                                 pref.setString("did", id_[index]);
          //
          //                                 Navigator.push(
          //                                   context,
          //                                   MaterialPageRoute(builder: (context) => UsersentreviewaboutworkersPage(title: '',)),
          //                                 );
          //
          //
          //
          //
          //                               },
          //                               child: Text("Review"),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             ElevatedButton(
          //                               onPressed: () async {
          //
          //                                 final pref =await SharedPreferences.getInstance();
          //                                 pref.setString("wid", id_[index]);
          //
          //                                 Navigator.push(
          //                                   context,
          //                                   MaterialPageRoute(builder: (context) => viewservicePage(title: '',)),
          //                                 );
          //
          //
          //
          //
          //                               },
          //                               child: Text("Services"),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   // ElevatedButton(
          //                   //   onPressed: () async {
          //                   //
          //                   //     final pref =await SharedPreferences.getInstance();
          //                   //     pref.setString("did", id_[index]);
          //                   //
          //                   //     Navigator.push(
          //                   //       context,
          //                   //       MaterialPageRoute(builder: (context) => UsersentreviewaboutworkersPage(title: '',)),
          //                   //     );
          //                   //
          //                   //
          //                   //
          //                   //
          //                   //   },
          //                   //   child: Text("Review"),
          //                   // ),
          //                 ]
          //             )
          //
          //             ,
          //             elevation: 8,
          //             margin: EdgeInsets.all(10),
          //           )),
          //     );
          //   },
          // )
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
