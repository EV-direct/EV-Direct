import 'dart:convert';
import 'package:evdirect/worker_home_newtemp.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

void main() {
  runApp(const MyAddService());
}

class MyAddService extends StatelessWidget {
  const MyAddService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyAddServicePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyAddServicePage extends StatefulWidget {
  const MyAddServicePage({super.key, required this.title});



  final String title;

  @override
  State<MyAddServicePage> createState() => _MyAddServicePageState();
}

class _MyAddServicePageState extends State<MyAddServicePage> {
  TextEditingController servicecontroller = new TextEditingController();
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

          backgroundColor: Theme.of(context).colorScheme.primary,

          leading: BackButton( color: Colors.white,),
          title: Text("Add services", style: TextStyle(color: Colors.white),),
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
                    controller: servicecontroller,
                    validator: (value)=>Validateservice(value!),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Service',
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

    String service=servicecontroller.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/worker_add_services/');
    try {

      final response = await http.post(urls, body: {
        "services":service,
        'lid':sh.getString('lid').toString()

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'service added');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => WorkerHomeNew(title: "home"),));
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
  String? Validateservice(String value){
    if(value.isEmpty){
      return 'please Enter a Service';
    }
    return null;
  }
}

