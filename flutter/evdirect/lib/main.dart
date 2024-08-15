import 'package:evdirect/login_temp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyWorkerHomepage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyWorkerHomepage extends StatefulWidget {
  const MyWorkerHomepage({super.key, required this.title});



  final String title;

  @override
  State<MyWorkerHomepage> createState() => _MyWorkerHomepageState();
}

class _MyWorkerHomepageState extends State<MyWorkerHomepage> {
TextEditingController ipcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: ipcontroller,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  labelText: 'ip Address',
            ),
              ),
            ),
            Container(
              height:50,
              padding:const EdgeInsets.fromLTRB(10,0,10,0,),
              child: ElevatedButton(
                child: const Text('Sumbit'),
                onPressed: () {
senddata();
                },
    )
    ),
          ],
        ),
      ),

    );
  }
  void senddata()async{
    String ipadress=ipcontroller.text;


    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString("url","http://"+ipadress+":8000/myapp");
    sh.setString("img_url","http://"+ipadress+":8000");

    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(title: '',)));
  }
}
