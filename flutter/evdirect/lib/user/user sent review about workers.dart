import 'dart:convert';

import 'package:evdirect/user/userhome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home_newtemp.dart';

void main() {
  runApp(const Usersentreviewaboutworkers());
}

class Usersentreviewaboutworkers extends StatelessWidget {
  const Usersentreviewaboutworkers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UsersentreviewaboutworkersPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class UsersentreviewaboutworkersPage extends StatefulWidget {
  const UsersentreviewaboutworkersPage({super.key, required this.title});



  final String title;

  @override
  State<UsersentreviewaboutworkersPage> createState() => _UsersentreviewaboutworkersPageState();
}

class _UsersentreviewaboutworkersPageState extends State<UsersentreviewaboutworkersPage> {
  TextEditingController reviewcontroller = new TextEditingController();
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

          title: Text("Review about worker", style: TextStyle(color: Colors.white),),
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
                    controller: reviewcontroller,
                    validator: (value)=>Validatereview(value!),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'review',
                    ),
                  ),
                ),

                Container(
                    height:48,
                    padding:const EdgeInsets.fromLTRB(8,0,10,0,),
                    child: ElevatedButton(
                      child: const Text('Add'),
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

    String review=reviewcontroller.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String did = sh.getString('did').toString();

    final urls = Uri.parse('$url/usr_send_review/');
    try {

      final response = await http.post(urls, body: {
        "review":review,
        'did':did,
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

  String? Validatereview(String value){
    if(value.isEmpty){
      return 'please Enter a review';
    }
    return null;
  }

}
