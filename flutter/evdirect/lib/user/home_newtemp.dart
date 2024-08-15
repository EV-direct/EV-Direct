
import 'package:evdirect/user/user%20sent%20complaint.dart';
import 'package:evdirect/user/user%20sent%20feedback.dart';
import 'package:evdirect/user/user%20view%20booking%20status.dart';
import 'package:evdirect/user/user%20view%20ev%20station.dart';
import 'package:evdirect/user/user%20view%20other%20users%20.dart';
import 'package:evdirect/user/user%20view%20reply.dart';
import 'package:evdirect/user/user%20view%20worker%20service%20status.dart';
import 'package:evdirect/user/user%20view%20workers.dart';
import 'package:evdirect/user/userchange%20password.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import '../add doubts.dart';
import '../login.dart';
import '../login_temp.dart';
import 'userview profile.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ',
      theme: ThemeData(

        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyUserHomePage(title: ''),
    );
  }
}

class MyUserHomePage extends StatefulWidget {
  const MyUserHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyUserHomePage> createState() => _MyUserHomePageState();
}

class _MyUserHomePageState extends State<MyUserHomePage> {
  TextEditingController ipcontroller=new TextEditingController();



  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("HOME", style: TextStyle(color: Colors.white),),

          actions: [IconButton(
            color: Colors.white,
            icon: const Icon(Icons.logout),

            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginPage(title: '',),));
            },
          ),],
          backgroundColor: Color.fromARGB(255, 27, 187, 146),

        ),
        body:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-vector/geometric-neon-hexagonal-bipyramid-background-vector_53876-171417.jpg?t=st=1710686256~exp=1710689856~hmac=952a3c59a6a2bb6509640578497673de4a7902e363ebef8c05345280d4ab7ad7&w=360'), fit: BoxFit.cover),
          ),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 210,
              childAspectRatio: 10/10,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,

            ),
            padding: const EdgeInsets.all(8.0),
            children: [
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(132, 129, 107, 155),


                      borderRadius: BorderRadius.circular(15)),
                  child:  Column(
                      children: [
                        SizedBox(height: 5.0),
                        InkWell(

                          child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.audMX4ZGbvT2_GJTx2c4GgHaHw?w=198&h=207&c=7&r=0&o=5&dpr=1.3&pid=1.7')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => userprofilepageless(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Profile",style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                            ),],
                        ),


                      ]
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(132, 129, 107, 155),


                      borderRadius: BorderRadius.circular(15)),
                  child:  Column(
                      children: [
                        SizedBox(height: 5.0),
                        InkWell(

                          child: CircleAvatar(
                            backgroundColor: Colors.white,

                            radius: 50,
                            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.08BBxOeDDSNJxxl0XXtcUQHaHa?pid=ImgDet&w=200&h=200&c=7&dpr=1.3'),
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => UserchangepasswordPage(title: 'title'),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text(" Change Password",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
                              )),
                            ),],
                        ),


                      ]
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(132, 129, 107, 155),


                      borderRadius: BorderRadius.circular(15)),
                  child:  Column(
                      children: [
                        SizedBox(height: 5.0),
                        InkWell(

                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: NetworkImage('https://cdn3.iconfinder.com/data/icons/professionals-flat-colorful-long-shadow/614/1592_-_Mechanic_Male-1024.png')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewWorkers(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Workers",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
                              )),
                            ),],
                        ),


                      ]
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(132, 129, 107, 155),


                      borderRadius: BorderRadius.circular(15)),
                  child:  Column(
                      children: [
                        SizedBox(height: 5.0),
                        InkWell(

                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: NetworkImage('https://th.bing.com/th/id/R.8786e3112a019c654d8487ec53e418eb?rik=ec1naZhVG0yhdA&riu=http%3a%2f%2falarabigroupuae.com%2fwp-content%2fuploads%2f2018%2f03%2fhs4.jpg&ehk=u9XCwdfVcpGQwnQDV6EhtLU%2fiOaLq9XV4qUU6KBDYF4%3d&risl=&pid=ImgRaw&r=0')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewServiceStatus(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Service Status",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
                              )),
                            ),],
                        ),


                      ]
                  )
              ),Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(132, 129, 107, 155),


                      borderRadius: BorderRadius.circular(15)),
                  child:  Column(
                      children: [
                        SizedBox(height: 5.0),
                        InkWell(

                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.O4gOKkCftfbBvP0938_V_wAAAA?pid=ImgDet&w=200&h=200&c=7&dpr=1.3')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => UserviewotherusersPage(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Other users",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
                              )),
                            ),],
                        ),


                      ]
                  )
              ),Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(132, 129, 107, 155),


                      borderRadius: BorderRadius.circular(15)),
                  child:  Column(
                      children: [
                        SizedBox(height: 5.0),
                        InkWell(

                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.sRAUKu9zYKWSKMu9FG4s5wHaHa?pid=ImgDet&w=200&h=200&c=7&dpr=1.3')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewEvStations(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Ev stations ",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
                              )),
                            ),],
                        ),


                      ]
                  )
              ),
              // Container(
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         color:  Color.fromARGB(132, 129, 107, 155),
              //
              //
              //         borderRadius: BorderRadius.circular(15)),
              //     child:  Column(
              //         children: [
              //           SizedBox(height: 5.0),
              //           InkWell(
              //
              //             child: CircleAvatar(
              //                 radius: 50,
              //                 // backgroundImage: AssetImage('assets/profile.jpg')
              //             ),
              //             onTap: () {Navigator.push(context, MaterialPageRoute(
              //               builder: (context) => MyLogin(title: "view profile"),));},
              //           ),
              //           SizedBox(height: 30.0),
              //           // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
              //           Column(
              //             children: [
              //               Padding(
              //                 padding: EdgeInsets.all(1),
              //                 child: Text("comments",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
              //                 )),
              //               ),],
              //           ),
              //
              //
              //         ]
              //     )
              // ),
              // Container(
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         color:  Color.fromARGB(132, 129, 107, 155),
              //
              //
              //         borderRadius: BorderRadius.circular(15)),
              //     child:  Column(
              //         children: [
              //           SizedBox(height: 5.0),
              //           InkWell(
              //
              //             child: CircleAvatar(
              //                 radius: 50,
              //                 // backgroundImage: AssetImage('assets/profile.jpg')
              //             ),
              //             onTap: () {Navigator.push(context, MaterialPageRoute(
              //               builder: (context) => MyLogin(title: "view profile"),));},
              //           ),
              //           SizedBox(height: 30.0),
              //           // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
              //           Column(
              //             children: [
              //               Padding(
              //                 padding: EdgeInsets.all(1),
              //                 child: Text("others post nd send comments",style: TextStyle(color: Colors.white,
              //                   fontSize: 15,
              //                    // fontWeight: FontWeight.bold,
              //                 )),
              //               ),],
              //           ),
              //
              //
              //         ]
              //     )
              // ),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(132, 129, 107, 155),


                      borderRadius: BorderRadius.circular(15)),
                  child:  Column(
                      children: [
                        SizedBox(height: 5.0),
                        InkWell(

                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/006/467/443/original/online-booking-editable-isometric-icon-vector.jpg')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => UserviewbookingstatusPage(),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Booking status",style: TextStyle(color: Colors.white,fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                            ),],
                        ),


                      ]
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(132, 129, 107, 155),


                      borderRadius: BorderRadius.circular(15)),
                  child:  Column(
                      children: [
                        SizedBox(height: 5.0),
                        InkWell(

                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: NetworkImage('https://cdn0.iconfinder.com/data/icons/office-50/512/reply-512.png')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewuserreplyPage(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Complaint",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
                              )),
                            ),],
                        ),


                      ]
                  )
              ),Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(132, 129, 107, 155),


                      borderRadius: BorderRadius.circular(15)),
                  child:  Column(
                      children: [
                        SizedBox(height: 5.0),
                        InkWell(

                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: NetworkImage('https://cdn0.iconfinder.com/data/icons/office-50/512/reply-512.png')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SendFeedback(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Feedback",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
                              )),
                            ),],
                        ),


                      ]
                  )
              ),
              // Container(
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         color:  Color.fromARGB(132, 129, 107, 155),
              //
              //
              //         borderRadius: BorderRadius.circular(15)),
              //     child:  Column(
              //         children: [
              //           SizedBox(height: 5.0),
              //           InkWell(
              //
              //             child: CircleAvatar(
              //                 backgroundColor: Colors.white,
              //                 radius: 50,
              //                 backgroundImage: NetworkImage('https://cdn1.iconfinder.com/data/icons/heroicons-ui/24/logout-1024.png')
              //             ),
              //             onTap: () {Navigator.push(context, MaterialPageRoute(
              //               builder: (context) => LoginPage(title: ""),));},
              //           ),
              //           SizedBox(height: 30.0),
              //           // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
              //           Column(
              //             children: [
              //               Padding(
              //                 padding: EdgeInsets.all(1),
              //                 child: Text("Logout",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
              //                 )),
              //               ),],
              //           ),
              //
              //
              //         ]
              //     )
              // ),

              // Container(
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         color:  Color.fromARGB(132, 129, 107, 155),
              //
              //
              //         borderRadius: BorderRadius.circular(15)),
              //     child:  Column(
              //         children: [
              //           SizedBox(height: 5.0),
              //           InkWell(
              //
              //             child: CircleAvatar(
              //               backgroundColor: Colors.white,
              //               radius: 50,
              //               backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/4477/4477517.png')
              //             ),
              //             onTap: () {Navigator.push(context, MaterialPageRoute(
              //               builder: (context) => MyUserSendFeedbackPage(title: ""),));},
              //           ),
              //           SizedBox(height: 30.0),
              //           // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
              //           Column(
              //             children: [
              //               Padding(
              //                 padding: EdgeInsets.all(1),
              //                 child: Text("Feedback",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
              //                 )),
              //               ),],
              //           ),
              //
              //
              //         ]
              //     )
              // ),


            ],

          ),
        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color:  Color.fromARGB(132, 13, 16, 61),


                ),
                child:
                Column(children: [

                  Text(
                    'Ev Charging',
                    style: TextStyle(fontSize: 20,color: Colors.white),

                  ),
                  CircleAvatar(radius: 50,
                      backgroundImage: NetworkImage('https://atlas-content-cdn.pixelsquid.com/assets_v2/264/2649544030370666213/jpeg-600/G03.jpg?modifiedAt=1')
                  ),




                ])


                ,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeNew(),));
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_page_rounded),
                title: const Text(' View profile '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => userprofilepageless(title: ''),));
                },
              ),
              ListTile(
                leading: Icon(Icons.password_rounded),
                title: const Text(" Change Password "),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserchangepasswordPage(title: 'title'),));
                },
              ),
              ListTile(
                leading: Icon(Icons.people_alt_rounded),
                title: const Text('  View workers '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewWorkers(title: " ",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.electrical_services_rounded),
                title: const Text(' View Service Status '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewServiceStatus(title: " ",),));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.medical_services_outlined),
              //   title: const Text(' View Test Details '),
              //   onTap: () {
              //     Navigator.pop(context);
              //     // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewTestDetailsPage(title: "Test Details",),));
              //   },
              // ),


              // ListTile(
              //   leading: Icon(Icons.local_pharmacy),
              //   title: const Text(' View Pharmacy '),
              //   onTap: () {
              //     Navigator.pop(context);
              //     // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPharmacy(title: "Pharmacy",),));
              //   },
              //
              // ),

              // ListTile(
              //   leading: Icon(Icons.payment_outlined),
              //   title: const Text('  '),
              //   onTap: () {
              //     Navigator.pop(context);
              //     // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMedicineOrderPage(title: "Medicine Order Details",),));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.comment_bank_rounded),
                title: const Text(' Add doubts'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => adddoubtspage(title: ''),));
                },
              ),
              ListTile(
                leading: Icon(Icons.people_rounded),
                title: const Text(' View other users '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserviewotherusersPage(title: "",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.ev_station_rounded),
                title: const Text(' View EV Stations '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewEvStations(title: "",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.book_online_rounded),
                title: const Text(' View booking status'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserviewbookingstatusPage(),));
                },
              ),
              ListTile(
                leading: Icon(Icons.comment_rounded),
                title: const Text(' Send complaint'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SendComplaint(title: "View Feedback",),));
                },
              ),

              ListTile(
                leading: Icon(Icons.reply),
                title: const Text(' View reply '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewuserreplyPage(title: ""),));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout_rounded),
                title: const Text(' Logout '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: 'Add request',),));
                },
              ),
            ],
          ),
        ),





      ),
    );

  }

}