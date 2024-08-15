import 'dart:convert';

import 'package:evdirect/user/userhome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../login.dart';
import 'home_newtemp.dart';

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
      home: const EvSendComplaint(title: 'Flutter Demo Home Page'),
    );
  }
}

class EvSendComplaint extends StatefulWidget {
  const EvSendComplaint({super.key, required this.title});



  final String title;

  @override
  State<EvSendComplaint> createState() => _EvSendComplaintState();
}

class _EvSendComplaintState extends State<EvSendComplaint> {
  TextEditingController complaintcontroller = new TextEditingController();
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

          title: Text("Sent Complaint", style: TextStyle(color: Colors.white),),
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
                    maxLines: 8,
                    controller: complaintcontroller,
                    validator: (value)=>Validatecomplaint(value!),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Complaint',
                    ),
                  ),
                ),



                Container(
                    height:48,
                    padding:const EdgeInsets.fromLTRB(8,0,10,0,),
                    child: ElevatedButton(
                      child: const Text('Send'),
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

    String complaint=complaintcontroller.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String eid = sh.getString('eid').toString();

    final urls = Uri.parse('$url/usr_send_evstation_complaint/');
    try {

      final response = await http.post(urls, body: {
        "complaint":complaint,
        "eid":eid,
        'lid':sh.getString('lid').toString()

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'send');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyUserHomePage(title: "home"),));
        }else {
          Fluttertoast.showToast(msg: 'Error occcured Found');
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

  String? Validatecomplaint(String value){
    if(value.isEmpty){
      return 'please Enter a complaint';
    }
    return null;
  }

}


