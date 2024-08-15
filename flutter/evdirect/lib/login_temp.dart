import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:evdirect/user/home_newtemp.dart';
import 'package:evdirect/worker_home_newtemp.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:evdirect/signup.dart';
import 'package:evdirect/user/user%20signup.dart';
import 'package:evdirect/user/userhome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home.dart';


void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: login_temp(),
  )
);

class login_temp extends StatelessWidget {



	TextEditingController usernamecontroller = new TextEditingController();
	TextEditingController passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
			Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 400,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/images/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                    child: FadeInUp(duration: Duration(seconds: 1), child: Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-1.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child: FadeInUp(duration: Duration(milliseconds: 1200), child: Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-2.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                    child: FadeInUp(duration: Duration(milliseconds: 1300), child: Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/clock.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    child: FadeInUp(duration: Duration(milliseconds: 1600), child: Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
	                  )
	                ],
	              ),
	            ),
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                  FadeInUp(duration: Duration(milliseconds: 1800), child: Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromRGBO(143, 148, 251, 1)),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
	                          ),
	                          child: TextField(
															controller: usernamecontroller,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Email or Phone number",
	                              hintStyle: TextStyle(color: Colors.grey[700])
	                            ),
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          child: TextField(
															controller: passwordcontroller,
                              obscureText: true,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Password",
	                              hintStyle: TextStyle(color: Colors.grey[700])
	                            ),
	                          ),
	                        )
	                      ],
	                    ),
	                  )),
	                  SizedBox(height: 30,),
	                  FadeInUp(duration: Duration(milliseconds: 1900), child: Container(
	                    height: 50,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromRGBO(143, 148, 251, 1),
	                          Color.fromRGBO(143, 148, 251, .6),
	                        ]
	                      )
	                    ),
											child: Center(
												child: InkWell(
													onTap: () async {
														String uname = usernamecontroller.text;
														String password = passwordcontroller.text;

														SharedPreferences sh =
														await SharedPreferences.getInstance();
														String url = sh.getString('url').toString();

														final urls =
														Uri.parse('$url/login_android/');
														try {
															final response = await http.post(urls, body: {
																'username': uname,
																'password': password,
															});
															if (response.statusCode == 200) {
																String status =
																jsonDecode(response.body)['status'];
																String type =
																jsonDecode(response.body)['type'];
																if (status == 'ok') {
																	String lid =
																	jsonDecode(response.body)['lid']
																			.toString();
																	sh.setString("lid", lid);
																	Fluttertoast.showToast(
																			msg: 'login successfully');
																	if (type == 'worker') {
																		Navigator.push(
																			context,
																			MaterialPageRoute(
																				builder: (context) =>
																						WorkerHomeNew(title: "Home"),
																			),
																		);
																	} else if (type == 'user') {
																		Navigator.push(
																			context,
																			MaterialPageRoute(
																				builder: (context) =>
																						MyUserHomePage(title: "Home"),
																			),
																		);
																	}
																} else {
																	// Show error message for incorrect password
																	Fluttertoast.showToast(
																			msg: 'Incorrect username or password');
																}
															} else {
																Fluttertoast.showToast(
																		msg: 'Network Error');
															}
														} catch (e) {
															Fluttertoast.showToast(msg: e.toString());
														}
													},
													child: Text("Login",
															style: TextStyle(
																	color: Colors.white,
																	fontWeight: FontWeight.bold)),
												),
											),
	                    // child: Center(
	                    //   child: InkWell(
											// 			onTap: () async {
											// 				String uname=usernamecontroller.text;
											// 				String password=passwordcontroller.text;
											//
											//
											//
											// 				SharedPreferences sh = await SharedPreferences.getInstance();
											// 				String url = sh.getString('url').toString();
											//
											// 				final urls = Uri.parse('$url/login_android/');
											// 				try {
											// 					final response = await http.post(urls, body: {
											// 						'username':uname,
											// 						'password':password,
											//
											//
											// 					});
											// 					if (response.statusCode == 200) {
											// 						String status = jsonDecode(response.body)['status'];
											// 						String type = jsonDecode(response.body)['type'];
											// 						if (status=='ok') {
											//
											// 							String lid=jsonDecode(response.body)['lid'].toString();
											// 							sh.setString("lid", lid);
											// 							Fluttertoast.showToast(msg: 'login successfully');
											// 							if(type=='worker'){
											// 								Navigator.push(context, MaterialPageRoute(
											// 									builder: (context) => WorkerHomeNew(title: "Home"),));
											// 							}
											// 							else if(type =='user'){
											// 								Navigator.push(context, MaterialPageRoute(
											// 									builder: (context) => MyUserHomePage(title: "Home"),));
											//
											//
											//
											// 							}
											//
											//
											//
											// 						}else {
											// 							Fluttertoast.showToast(msg: 'Not Found');
											// 						}
											// 					}
											// 					else {
											// 						Fluttertoast.showToast(msg: 'Network Error');
											// 					}
											// 				}
											// 				catch (e){
											// 					Fluttertoast.showToast(msg: e.toString());
											// 				}
											// 			},
											// 			child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
	                    // ),
	                  )),
	                  SizedBox(height: 70,),
	                  FadeInUp(duration: Duration(milliseconds: 2000), child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
  }
	// void _send_data() async{
	//
	//
	// 	String uname=usernamecontroller.text;
	// 	String password=passwordcontroller.text;
	//
	//
	//
	// 	SharedPreferences sh = await SharedPreferences.getInstance();
	// 	String url = sh.getString('url').toString();
	//
	// 	final urls = Uri.parse('$url/login_android/');
	// 	try {
	// 		final response = await http.post(urls, body: {
	// 			'username':uname,
	// 			'password':password,
	//
	//
	// 		});
	// 		if (response.statusCode == 200) {
	// 			String status = jsonDecode(response.body)['status'];
	// 			String type = jsonDecode(response.body)['type'];
	// 			if (status=='ok') {
	//
	// 				String lid=jsonDecode(response.body)['lid'].toString();
	// 				sh.setString("lid", lid);
	// 				Fluttertoast.showToast(msg: 'login successfully');
	// 				if(type=='worker'){
	// 					Navigator.push(context, MaterialPageRoute(
	// 						builder: (context) => WorkerHomepage(title: "Home"),));
	// 				}
	// 				else if(type =='user'){
	// 					Navigator.push(context, MaterialPageRoute(
	// 						builder: (context) => userhomepage(title: "Home"),));
	//
	//
	// 				}
	//
	//
	//
	// 			}else {
	// 				Fluttertoast.showToast(msg: 'Not Found');
	// 			}
	// 		}
	// 		else {
	// 			Fluttertoast.showToast(msg: 'Network Error');
	// 		}
	// 	}
	// 	catch (e){
	// 		Fluttertoast.showToast(msg: e.toString());
	// 	}
	// }

}