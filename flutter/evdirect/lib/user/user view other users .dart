import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ViewUserReview());
}

class ViewUserReview extends StatelessWidget {
  const ViewUserReview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserviewotherusersPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class UserviewotherusersPage extends StatefulWidget {
  const UserviewotherusersPage({super.key, required this.title});



  final String title;

  @override
  State<UserviewotherusersPage> createState() => _UserviewotherusersPageState();
}

class _UserviewotherusersPageState extends State<UserviewotherusersPage> {
  _UserviewotherusersPageState(){
    get_data();
  }

  List<String> id_=<String>[];
  List<String> username_=<String>[];
  List<String> place_=<String>[];
  List<String> email_=<String>[];
  List<String> city_=<String>[];
  List<String> state_=<String>[];
  List<String> pin_=<String>[];
  List<String> photo_=<String>[];
  List<String> phone_=<String>[];
  List<String> gender_=<String>[];

  Future<void> get_data() async {
    List<String> id=<String>[];
    List<String> username=<String>[];
    List<String> place=<String>[];
    List<String> email=<String>[];
    List<String> city=<String>[];
    List<String> state=<String>[];
    List<String> pin=<String>[];
    List<String> photo=<String>[];
    List<String> phone=<String>[];
    List<String> gender=<String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/usr_view_other_users/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        username.add(arr[i]['uname']);
        place.add(arr[i]['place']);
        email.add(arr[i]['email']);
        city.add(arr[i]['city']);
        state.add(arr[i]['state']);
        pin.add(arr[i]['pin']);
        photo.add(sh.getString("img_url").toString()+arr[i]['photo']);
        phone.add(arr[i]['phone']);
        gender.add(arr[i]['gender']);

      }

      setState(() {
        id_ = id;
        username_=username;
        place_=place;
        email_=email;
        city_=city;
        state_=state;
        pin_=pin;
        photo_=photo;
        phone_=phone;
        gender_=gender;

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

          title: Text("Other users", style: TextStyle(color: Colors.white),),
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
                                  "Name: " + username_[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Place: " + place_[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  "Email: " + email_[index],
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
        //             Column(
        //               children: [
        //                 Padding(
        //                   padding: EdgeInsets.all(5),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text('Name'),
        //                       Text(username_[index]),
        //                     ],
        //                   ),
        //                 ),
        //
        //                 Padding(
        //                   padding: EdgeInsets.all(5),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text('Place'),
        //                       Text(place_[index]),
        //                     ],
        //                   ),
        //                 ),
        //
        //                 Padding(
        //                   padding: EdgeInsets.all(5),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text('Email'),
        //                       Text(email_[index]),
        //                     ],
        //                   ),
        //                 ),
        //
        //               ],
        //             ),
        //
        //             elevation: 8,
        //             margin: EdgeInsets.all(10),
        //           )),
        //     );
        //   },
        // ),

      ),
    );
  }
}
