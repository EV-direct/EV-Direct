import 'dart:convert';

import 'package:evdirect/user/userhome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../login.dart';

void main() {
  runApp(const adddoubts());
}

class adddoubts extends StatelessWidget {
  const adddoubts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const adddoubtspage(title: 'Flutter Demo Home Page'),
    );
  }
}

class adddoubtspage extends StatefulWidget {
  const adddoubtspage({super.key, required this.title});



  final String title;

  @override
  State<adddoubtspage> createState() => _adddoubtspageState();
}

class _adddoubtspageState extends State<adddoubtspage> {
  TextEditingController adddoubtscontroller = new TextEditingController();

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

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(widget.title),
        ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: adddoubtscontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'adddoubts',
                  ),
                ),
              ),



              Container(
                  height:48,
                  padding:const EdgeInsets.fromLTRB(8,0,10,0,),
                  child: ElevatedButton(
                    child: const Text('Send'),
                    onPressed: () {
                      _send_data();
                    },
                  )
              ),


            ],
          ),
        ),

      ),
    );
  }
  void _send_data() async{

    String adddoubts=adddoubtscontroller.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/usr_add_doubts/');
    try {

      final response = await http.post(urls, body: {
        "adddoubts":adddoubts,
        'lid':sh.getString('lid').toString()

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'send');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => userhomepage(title: "home"),));
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

}


