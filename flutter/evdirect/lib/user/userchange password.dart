import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../login.dart';

void main() {
  runApp(const Userchangepassword());
}

class Userchangepassword extends StatelessWidget {
  const Userchangepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserchangepasswordPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class UserchangepasswordPage extends StatefulWidget {
  const UserchangepasswordPage({super.key, required this.title});



  final String title;

  @override
  State<UserchangepasswordPage> createState() => _UserchangepasswordPageState();
}

class _UserchangepasswordPageState extends State<UserchangepasswordPage> {
TextEditingController currentcontroller = new TextEditingController();
TextEditingController newpasswordcontroller = new TextEditingController();
TextEditingController confirmcontroller = new TextEditingController();
final _formKey=GlobalKey<FormState>();
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

          title: Text("Change password", style: TextStyle(color: Colors.white),),
        ),
        body: Center(

          child: Form(
            key: _formKey,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: currentcontroller,
                    obscureText: true,
                    validator: (value)=>Validatecurrentpass(value!),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Current password',
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: newpasswordcontroller,
                    obscureText: true,
    validator: (value)=>Validatenewpass(value!),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New password',
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: confirmcontroller,
                    obscureText: true,
                    validator: (value) => Validateconfirmpass(value, newpasswordcontroller.text),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm password',
                    ),
                  ),
                ),

                Container(
                    height:48,
                    padding:const EdgeInsets.fromLTRB(8,0,10,0,),
                    child: ElevatedButton(
                      child: const Text('Change password'),
                      onPressed: () {
    if(_formKey.currentState!.validate()) {

    _send_data();}

                      },
                    )
                ),


              ],
            ),
          ),
        ),

      ),
    );
  }
void _send_data() async{

  String old=currentcontroller.text;
  String new1=newpasswordcontroller.text;
  String confirm=confirmcontroller.text;

  SharedPreferences sh = await SharedPreferences.getInstance();
  String url = sh.getString('url').toString();

  final urls = Uri.parse('$url/worker_changepassword/');
  try {

    final response = await http.post(urls, body: {
      "current_password":old,
      "new_password":new1,
      "confirm_password":confirm,
      'lid':sh.getString('lid').toString()

    });
    if (response.statusCode == 200) {
      String status = jsonDecode(response.body)['status'];
      if (status=='ok') {

        Fluttertoast.showToast(msg: 'password changed successfully');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => LoginPage(title: "home"),));
      }else {
        Fluttertoast.showToast(msg: 'Current password error');
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

String? Validatecurrentpass(String value){
  if(value.isEmpty){
    return 'please enter current password';
  }
  return null;
}
// String? Validatenewpass(String value){
//   if(value.isEmpty){
//     return 'please enter New password';
//   }
//   return null;
// }
  String? Validatenewpass(String? value) {
    // Check if the input value is empty
    if (value == null || value.isEmpty) {
      return 'Please Enter a New password';
    }

    // Check if the password length is less than 6 characters
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    // If all validations pass, return null
    return null;
  }
// String? Validateconfirmpass(String value){
//   if(value.isEmpty){
//     return 'please confirm password';
//   }
//   return null;
// }

  String? Validateconfirmpass(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    // Check if the confirm password matches the original password
    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

}


