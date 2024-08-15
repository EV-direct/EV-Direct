

import 'package:evdirect/user/user%20view%20workers.dart';
import 'package:evdirect/view%20profile.dart';
import 'package:evdirect/view%20rejected%20user%20bookings.dart';
import 'package:evdirect/view%20services.dart';
import 'package:evdirect/view%20user%20booking.dart';
import 'package:evdirect/view%20verified%20user%20bookings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import '../add doubts.dart';
import '../login.dart';
import '../login_temp.dart';
import 'add services.dart';
import 'change password.dart';
import 'view user review.dart';





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
      home: const WorkerHomeNew(title: ''),
    );
  }
}

class WorkerHomeNew extends StatefulWidget {
  const WorkerHomeNew({super.key, required this.title});



  final String title;

  @override
  State<WorkerHomeNew> createState() => _WorkerHomeNewState();
}

class _WorkerHomeNewState extends State<WorkerHomeNew> {
  TextEditingController ipcontroller=new TextEditingController();



  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [IconButton(
            color: Colors.white,
            icon: const Icon(Icons.logout),

            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginPage(title: '',),));
            },
          ),],
          backgroundColor: Color.fromARGB(255, 27, 187, 146),

          title: Text("HOME", style: TextStyle(color: Colors.white),),
        ),
        body:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/premium-photo/optical-layer-with-imagination-creativity-photoelectric-component-technology-application_1048944-28457229.jpg?w=360'), fit: BoxFit.cover),
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
                              backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/6342/6342684.png')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewProfilePage(title: ""),));},
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
                            backgroundImage: NetworkImage('https://icon-library.com/images/43-512_7821.png'),
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MyAddServicePage(title: 'title'),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Add service",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
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
                              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ek0b7dx4kS8Jvtm_MSFhA5gW4t5o0OV-Qg1XjasRZnWbGb_cvelDVoFonlXxEJxKgZE&usqp=CAU')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewServicesPage(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("View Services",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
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
                              backgroundImage: NetworkImage('https://media.istockphoto.com/id/1299058472/vector/verified-webpage-concept-checked-and-approved-vectory-glyph-icon-design-cloud-computing-and.jpg?s=612x612&w=0&k=20&c=lA6PZ4Hq42mkpLdCDrGDklfKe4nqLMafajJafUC6mjE=')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewVerifiedUserBookingPage(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Verified user booking",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
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
                              backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/020/951/159/original/book-3d-icon-free-png.png')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewUserBookingPage(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("View user booking",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
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
                              backgroundImage: NetworkImage('https://c8.alamy.com/comp/EAHE1D/rejected-book-EAHE1D.jpg')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewRejectedUserBookingPage(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Rejected booking",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
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
                              backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/1591/1591045.png')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewUserReviewPage(title: ""),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("User review ",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
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
                              backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/6202/6202878.png')
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MyChangePasswordPage(title: '',),));},
                        ),
                        SizedBox(height: 30.0),
                        // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Change password",style: TextStyle(color: Colors.white,fontSize: 18,
                                fontWeight: FontWeight.bold,
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
                  color:  Color.fromARGB(132, 8, 27, 37),


                ),
                child:
                Column(children: [

                  Text(
                    'Ev Direct',
                    style: TextStyle(fontSize: 20,color: Colors.grey[200]),

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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfilePage(title: ''),));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.password_rounded),
              //   title: const Text(" Change Password "),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => UserchangepasswordPage(title: 'title'),));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.people_alt_rounded),
                title: const Text('  View workers '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewWorkers(title: " ",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.add_box_rounded),
                title: const Text(' Add services '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyAddServicePage(title: " ",),));
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
                leading: Icon(Icons.electrical_services_rounded),
                title: const Text(' Services'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewServicesPage(title: ''),));
                },
              ),
              ListTile(
                leading: Icon(Icons.verified_rounded),
                title: const Text(' Verified user booking '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewVerifiedUserBookingPage(title: "",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.book_online_rounded),
                title: const Text(' User booking '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewUserBookingPage(title: "",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.browser_not_supported_rounded),
                title: const Text(' Rejected booking'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewRejectedUserBookingPage(title: '',),));
                },
              ),
              ListTile(
                leading: Icon(Icons.reviews_rounded),
                title: const Text(' User review '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewUserReviewPage(title: "View Feedback",),));
                },
              ),

              ListTile(
                leading: Icon(Icons.password_outlined),
                title: const Text(' Change password '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyChangePasswordPage(title: ""),));
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