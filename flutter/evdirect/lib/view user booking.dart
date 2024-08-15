import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ViewUserBooking());
}

class ViewUserBooking extends StatelessWidget {
  const ViewUserBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewUserBookingPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ViewUserBookingPage extends StatefulWidget {
  const ViewUserBookingPage({super.key, required this.title});



  final String title;

  @override
  State<ViewUserBookingPage> createState() => _ViewUserBookingPageState();
}

class _ViewUserBookingPageState extends State<ViewUserBookingPage> {
  _ViewUserBookingPageState(){
  get_data();

  }

  List<String> id_=<String>[];
  List<String> service_=<String>[];
  List<String> user_=<String>[];
  List<String> date_=<String>[];
  List<String> status_=<String>[];

  Future<void> get_data() async {
    List<String> id=<String>[];
    List<String> service=<String>[];
    List<String> user=<String>[];
    List<String> date=<String>[];
    List<String> status=<String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/worker_view_userbooking/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        service.add(arr[i]['service']);
        user.add(arr[i]['user']);
        date.add(arr[i]['date']);
        status.add(arr[i]['status']);

      }

      setState(() {
        id_ = id;
        service_=service;
        user_=user;
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
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,

        leading: BackButton( color: Colors.white,),
        title: Text("User bookings", style: TextStyle(color: Colors.white),),
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    "Date",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ), Text(
                                    date_[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ), Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    "User",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ), Text(
                                    user_[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ), Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    "Service",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ), Text(
                                    service_[index],
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
                                      child: const Text('Approve'),
                                      onPressed: () {

                                        _send_data('accepted',id_[index]);
                                      },
                                    ),
                                    ElevatedButton(
                                      child: const Text('Reject'),
                                      onPressed: () {

                                        _send_data('rejected',id_[index]);
                                      },
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

    );
  }
  void _send_data(sts,bid) async{


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/worker_confirm_userbooking/');
    try {

      final response = await http.post(urls, body: {
        "status":sts,
        'bid':bid

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'booking $sts');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ViewUserBookingPage(title: "Booking"),));
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
  }

}
