import 'package:flutter/material.dart';

void main() {
  runApp(const Userveiwslotbookingstatus());
}

class Userveiwslotbookingstatus extends StatelessWidget {
  const Userveiwslotbookingstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter o',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserveiwslotbookingstatusPage(title: ''),
    );
  }
}

class UserveiwslotbookingstatusPage extends StatefulWidget {
  const UserveiwslotbookingstatusPage({super.key, required this.title});



  final String title;

  @override
  State<UserveiwslotbookingstatusPage> createState() => _UserveiwslotbookingstatusPageState();
}

class _UserveiwslotbookingstatusPageState extends State<UserveiwslotbookingstatusPage> {
List<String> id_=<String>[];
List<String> slot_=<String>[];
List<String> date_=<String>[];
List<String> status_=<String>[];

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

            ],
          ),
        ),

      ),
    );
  }
}
