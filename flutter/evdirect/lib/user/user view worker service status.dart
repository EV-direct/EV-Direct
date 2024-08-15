
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
      home: const ViewServiceStatus(title: 'Flutter Demo Home Page'),
    );
  }
}

class ViewServiceStatus extends StatefulWidget {
  const ViewServiceStatus({super.key, required this.title});


  final String title;

  @override
  State<ViewServiceStatus> createState() => _ViewServiceStatusState();
}

class _ViewServiceStatusState extends State<ViewServiceStatus> {

  _ViewServiceStatusState() {
    view_notification();
  }

  List<String> id_ = <String>[];
  List<String> SERVICE_=<String>[];
  List<String> date_=<String>[];
  List<String> status_=<String>[];



  Future<void> view_notification() async {
    List<String> id = <String>[];
    List<String> SERVICE=<String>[];
    List<String> date=<String>[];
    List<String> status=<String>[];


    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/usr_view_service_status/';

      var data = await http.post(Uri.parse(url), body: {
        'lid':lid


      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        SERVICE.add(arr[i]['SERVICE'].toString());
        date.add(arr[i]['date'].toString());
        status.add(arr[i]['status'].toString());
      }

      setState(() {
        id_ = id;
        SERVICE_=SERVICE;
        date_=date;
        status_=status;
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

            title: Text("Worker service status", style: TextStyle(color: Colors.white),),
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
                                  Text(
                                    "Service: " + SERVICE_[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Date: " + date_[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    "Status: " + status_[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
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
          //           child: Card(
          //             child:
          //             Row(
          //                 children: [
          //                   Column(
          //                     children: [
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('Service'),
          //                             Text(SERVICE_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('Date'),
          //                             Text(date_[index]),
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text('Status'),
          //                             Text(status_[index]),
          //                           ],
          //                         ),
          //                       ),
          //
          //                     ],
          //                   ),
          //                   // ElevatedButton(
          //                   //   onPressed: () async {
          //                   //
          //                   //     final pref =await SharedPreferences.getInstance();
          //                   //     pref.setString("did", id_[index]);
          //                   //
          //                   //     // Navigator.push(
          //                   //     //   context,
          //                   //     //   MaterialPageRoute(builder: (context) => ViewSchedule()),
          //                   //     // );
          //                   //
          //                   //
          //                   //
          //                   //
          //                   //   },
          //                   //   child: Text("Schedule"),
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

