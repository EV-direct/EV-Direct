// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// void main() {
//   runApp(Profile());
// }
//
// class Profile extends StatelessWidget {
//   Profile(){
//     _get_data();
//   }
//   String uname_ = "";
//   String email_ = "";
//   String place_ = "";
//   String phone_ = "";
//   String city_ = "";
//   String state_ = "";
//   String pin_ = "";
//   String gender_ = "";
//   String photo_ = "";
//
//
//
//
//   void _get_data() async{
//
//
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//     String img_url = sh.getString('img_url').toString();
//
//     final urls = Uri.parse('$url/usr_view_profile/');
//     try {
//       final response = await http.post(urls, body: {
//         'lid':lid
//
//
//
//
//
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status=='ok') {
//           String uname=jsonDecode(response.body)['uname'];
//           String gender=jsonDecode(response.body)['gender'];
//           String email=jsonDecode(response.body)['email'];
//           String phone=jsonDecode(response.body)['phone'];
//           String place=jsonDecode(response.body)['place'];
//           String city=jsonDecode(response.body)['city'];
//           String pin=jsonDecode(response.body)['pin'];
//           String state=jsonDecode(response.body)['state'];
//           String photo=img_url+jsonDecode(response.body)['photo'];
//
//
//
//           setState(() {
//
//             uname_= uname;
//             state_= state;
//             gender_= gender;
//             email_= email;
//             phone_= phone;
//             place_= place;
//             city_= city;
//             pin_= pin;
//             photo_= photo;
//           });
//
//
//
//
//
//         }else {
//           Fluttertoast.showToast(msg: 'Not Found');
//         }
//       }
//       else {
//         Fluttertoast.showToast(msg: 'Network Error');
//       }
//     }
//     catch (e){
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           body: Container(color: Colors.white54,
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const ListTile(
//                   leading: Icon(Icons.arrow_back),
//                   trailing: Icon(Icons.menu),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     CircleAvatar(
//                       maxRadius: 65,
//                       backgroundImage: AssetImage("assets/6195145.jpg"),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     CircleAvatar(
//                       backgroundImage: AssetImage("assets/download.png"),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     CircleAvatar(
//                       backgroundImage:
//                       AssetImage("assets/GooglePlus-logo-red.png"),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     CircleAvatar(
//                       backgroundImage: AssetImage(
//                           "assets/1_Twitter-new-icon-mobile-app.jpg"),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     CircleAvatar(
//                       backgroundImage:
//                       AssetImage("assets/600px-LinkedIn_logo_initials.png"),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Text(
//                       "Thomas Shelby",
//                       style:
//                       TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
//                     )
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [Text("@peakyBlinders")],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Text(
//                       "Master manipulator, deal-maker and\n                   entrepreneur",
//                       style: TextStyle(fontSize: 20),
//                     )
//                   ],
//                 ),const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   child: Expanded(
//                       child: ListView(
//                         children: [
//                           Card(
//                             margin:
//                             const EdgeInsets.only(left: 35, right: 35, bottom: 10),
//                             color: Colors.white70,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: const ListTile(
//                               leading: Icon(
//                                 Icons.privacy_tip_sharp,
//                                 color: Colors.black54,
//                               ),
//                               title: Text(
//                                 'Privacy',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               trailing: Icon(
//                                 Icons.arrow_forward_ios_outlined,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Card(
//                             color: Colors.white70,
//                             margin:
//                             const EdgeInsets.only(left: 35, right: 35, bottom: 10),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: const ListTile(
//                               leading: Icon(
//                                 Icons.history,
//                                 color: Colors.black54,
//                               ),
//                               title: Text(
//                                 'Purchase History',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               trailing: Icon(
//                                 Icons.arrow_forward_ios_outlined,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Card(
//                             color: Colors.white70,
//                             margin:
//                             const EdgeInsets.only(left: 35, right: 35, bottom: 10),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: const ListTile(
//                               leading:
//                               Icon(Icons.help_outline, color: Colors.black54),
//                               title: Text(
//                                 'Help & Support',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               trailing: Icon(
//                                 Icons.arrow_forward_ios_outlined,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Card(
//                             color: Colors.white70,
//                             margin:
//                             const EdgeInsets.only(left: 35, right: 35, bottom: 10),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: const ListTile(
//                               leading: Icon(
//                                 Icons.privacy_tip_sharp,
//                                 color: Colors.black54,
//                               ),
//                               title: Text(
//                                 'Settings',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               trailing: Icon(Icons.arrow_forward_ios_outlined),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Card(
//                             color: Colors.white70,
//                             margin:
//                             const EdgeInsets.only(left: 35, right: 35, bottom: 10),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: const ListTile(
//                               leading: Icon(
//                                 Icons.add_reaction_sharp,
//                                 color: Colors.black54,
//                               ),
//                               title: Text(
//                                 'Invite a Friend',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               trailing: Icon(
//                                 Icons.arrow_forward_ios_outlined,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Card(
//                             color: Colors.white70,
//                             margin:
//                             const EdgeInsets.only(left: 35, right: 35, bottom: 10),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: const ListTile(
//                               leading: Icon(
//                                 Icons.logout,
//                                 color: Colors.black54,
//                               ),
//                               title: Text(
//                                 'Logout',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               trailing: Icon(Icons.arrow_forward_ios_outlined),
//                             ),
//                           )
//                         ],
//                       )),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const userhomepageless());
}

class userhomepageless extends StatelessWidget {
  const userhomepageless({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const userprofilepageless(title: 'Flutter Demo Home Page'),
    );
  }
}

class userprofilepageless extends StatefulWidget {
  const userprofilepageless({super.key, required this.title});



  final String title;

  @override
  State<userprofilepageless> createState() => _userprofilepagelessState();
}

class _userprofilepagelessState extends State<userprofilepageless> {
  _userprofilepagelessState(){
    _get_data();
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
      }
      ,
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(widget.title),
        ),
        body: Container(color: Colors.white54,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const ListTile(
                leading: Icon(Icons.arrow_back),
                trailing: Icon(Icons.menu),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    maxRadius: 65,
                    backgroundImage: AssetImage("assets/6195145.jpg"),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/download.png"),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/GooglePlus-logo-red.png"),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/1_Twitter-new-icon-mobile-app.jpg"),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/600px-LinkedIn_logo_initials.png"),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Thomas Shelby",
                    style:
                    TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text("@peakyBlinders")],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Master manipulator, deal-maker and\n                   entrepreneur",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),const SizedBox(
                height: 15,
              ),
              Container(
                child: Expanded(
                    child: ListView(
                      children: [
                        Card(
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.privacy_tip_sharp,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Privacy',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.history,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Purchase History',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading:
                            Icon(Icons.help_outline, color: Colors.black54),
                            title: Text(
                              'Help & Support',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.privacy_tip_sharp,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Settings',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.add_reaction_sharp,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Invite a Friend',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Update'),
                          onPressed: () {

                          },
                        )
                      ],

                    )),
              )
            ],
          ),

        ),

      ),
    );
  }
  String uname_ = "";
  String email_ = "";
  String place_ = "";
  String phone_ = "";
  String city_ = "";
  String state_ = "";
  String pin_ = "";
  String gender_ = "";
  String photo_ = "";




  void _get_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String img_url = sh.getString('img_url').toString();

    final urls = Uri.parse('$url/usr_view_profile/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid





      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {
          String uname=jsonDecode(response.body)['uname'];
          String gender=jsonDecode(response.body)['gender'];
          String email=jsonDecode(response.body)['email'];
          String phone=jsonDecode(response.body)['phone'];
          String place=jsonDecode(response.body)['place'];
          String city=jsonDecode(response.body)['city'];
          String pin=jsonDecode(response.body)['pin'];
          String state=jsonDecode(response.body)['state'];
          String photo=img_url+jsonDecode(response.body)['photo'];



          setState(() {

            uname_= uname;
            state_= state;
            gender_= gender;
            email_= email;
            phone_= phone;
            place_= place;
            city_= city;
            pin_= pin;
            photo_= photo;
          });





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
