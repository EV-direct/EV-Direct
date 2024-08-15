import 'dart:convert';
import 'package:evdirect/update%20profile.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ViewProfile());
}

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewProfilePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key, required this.title});



  final String title;

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
_ViewProfilePageState(){
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
      },
      child: Scaffold(
        appBar: AppBar(

          // backgroundColor: Color(0xFF1bbb92), // Change 0xFF1bbb92 to the custom color you want


          backgroundColor: Theme.of(context).colorScheme.primary,

          leading: BackButton( color: Colors.white,),
          title: Text("Your Profile", style: TextStyle(color: Colors.white),),
        ),
        body: Container(color: Colors.white54,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              // const ListTile(
              //   leading: Icon(Icons.arrow_back),
              //   trailing: Icon(Icons.menu),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  CircleAvatar(
                    maxRadius: 65,
                    backgroundImage: NetworkImage(photo_),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     CircleAvatar(
              //       backgroundImage: AssetImage("assets/download.png"),
              //     ),
              //     SizedBox(
              //       width: 15,
              //     ),
              //     CircleAvatar(
              //       backgroundImage:
              //       AssetImage("assets/GooglePlus-logo-red.png"),
              //     ),
              //     SizedBox(
              //       width: 15,
              //     ),
              //     CircleAvatar(
              //       backgroundImage: AssetImage(
              //           "assets/1_Twitter-new-icon-mobile-app.jpg"),
              //     ),
              //     SizedBox(
              //       width: 15,
              //     ),
              //     CircleAvatar(
              //       backgroundImage:
              //       AssetImage("assets/600px-LinkedIn_logo_initials.png"),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    name_,
                    style:
                    TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [Text(email_)],
              ),
              const SizedBox(
                height: 15,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     Text(
              //       "Master manipulator, deal-maker and\n                   entrepreneur",
              //       style: TextStyle(fontSize: 20),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Expanded(
                    child: ListView(
                      children: [
                        Card(
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child:  ListTile(
                            leading: Icon(
                              Icons.call,
                              color: Colors.black54,
                            ),
                            title: Text(
                              "Phone : "+phone_,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // trailing: Icon(
                            //   Icons.arrow_forward_ios_outlined,
                            //   color: Colors.black54,
                            // ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child:  ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: Colors.black54,
                            ),
                            title: Text(
                              "Place : "+place_,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // trailing: Icon(
                            //   Icons.arrow_forward_ios_outlined,
                            //   color: Colors.black54,
                            // ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child:  ListTile(
                            leading:
                            Icon(Icons.location_city, color: Colors.black54),
                            title: Text(
                              "City : "+city_,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // trailing: Icon(
                            //   Icons.arrow_forward_ios_outlined,
                            //   color: Colors.black54,
                            // ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child:  ListTile(
                            leading: Icon(
                              Icons.pin,
                              color: Colors.black54,
                            ),
                            title: Text(
                              "Pin : "+pin_,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // trailing: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child:  ListTile(
                            leading: Icon(
                              Icons.line_style_rounded,
                              color: Colors.black54,
                            ),
                            title: Text(
                              "Category : "+cat_,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // trailing: Icon(
                            //   Icons.arrow_forward_ios_outlined,
                            //   color: Colors.black54,
                            // ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          child: const Text('Update Profile'),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => UpdateProfilePage(title: "home"),));
                          },
                        ),
                        // Card(
                        //   color: Colors.white70,
                        //   margin:
                        //   const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(30)),
                        //   child: const ListTile(
                        //     leading: Icon(
                        //       Icons.add_reaction_sharp,
                        //       color: Colors.black54,
                        //     ),
                        //     title: Text(
                        //       'Invite a Friend',
                        //       style: TextStyle(
                        //           fontSize: 18, fontWeight: FontWeight.bold),
                        //     ),
                        //     trailing: Icon(
                        //       Icons.arrow_forward_ios_outlined,
                        //       color: Colors.black54,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Card(
                        //   color: Colors.white70,
                        //   margin:
                        //   const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(30)),
                        //   child: const ListTile(
                        //     leading: Icon(
                        //       Icons.logout,
                        //       color: Colors.black54,
                        //     ),
                        //     title: Text(
                        //       'Logout',
                        //       style: TextStyle(
                        //           fontSize: 18, fontWeight: FontWeight.bold),
                        //     ),
                        //     trailing: Icon(Icons.arrow_forward_ios_outlined),
                        //   ),
                        // )
                      ],
                    )),
              )
            ],
          ),
        ),

      ),
    );


//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//         child: InkWell(
//           onTap: (){
//             showDialog(context: context, builder: (context) => Image.network(photo_),);
//           },
//           child: Column(
//
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//
//               CircleAvatar(
//                 backgroundImage: NetworkImage(photo_),
//               ),
//               SizedBox(height: 15,),
//
//               Text(name_),
//               SizedBox(height: 15,),
//
//               Text(email_),
//               SizedBox(height: 15,),
//
//               Text(place_),
//               SizedBox(height: 15,),
//
//               Text(phone_),
//               SizedBox(height: 15,),
//
//               Text(city_),
//               SizedBox(height: 15,),
//
//               Text(state_),
//               SizedBox(height: 15,),
//
//               Text(pin_),
//               SizedBox(height: 15,),
//
//               Text(gender_),
//               SizedBox(height: 15,),
//               Text(cat_),
//               SizedBox(height: 15,),
//
//               Container(
//                   height:50,
//                   padding:const EdgeInsets.fromLTRB(10,0,10,0,),
//                   child: ElevatedButton(
//                     child: const Text('Edit'),
//                     onPressed: () {
// Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfilePage(title: '',)));
//                     },
//                   )
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//
//     );
  }
  String name_ = "";
  String email_ = "";
  String place_ = "";
  String phone_ = "";
  String city_ = "";
  String state_ = "";
  String pin_ = "";
  String gender_ = "";
  String photo_ = "";
  String cat_ = "";
  void _get_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String img_url = sh.getString('img_url').toString();

    final urls = Uri.parse('$url/worker_view_profile/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid



      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {
          String name=jsonDecode(response.body)['name'];
          String gender=jsonDecode(response.body)['gender'];
          String email=jsonDecode(response.body)['email'];
          String phone=jsonDecode(response.body)['phone'];
          String place=jsonDecode(response.body)['place'];
          String city=jsonDecode(response.body)['city'];
          String pin=jsonDecode(response.body)['pin'];
          String state=jsonDecode(response.body)['state'];
          String cat=jsonDecode(response.body)['cat'];
          String photo=img_url+jsonDecode(response.body)['photo'];



          setState(() {

            name_= name;
            state_= state;
            gender_= gender;
            email_= email;
            phone_= phone;
            place_= place;
            city_= city;
            pin_= pin;
            cat_= cat;
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