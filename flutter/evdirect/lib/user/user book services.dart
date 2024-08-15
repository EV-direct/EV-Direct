import 'package:flutter/material.dart';

void main() {
  runApp(const Userbookservices());
}

class Userbookservices extends StatelessWidget {
  const Userbookservices({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserbookservicesPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class UserbookservicesPage extends StatefulWidget {
  const UserbookservicesPage({super.key, required this.title});



  final String title;

  @override
  State<UserbookservicesPage> createState() => _UserbookservicesPageState();
}

class _UserbookservicesPageState extends State<UserbookservicesPage> {
  List<String> id_=<String>[];
  List<String> service_=<String>[];
  List<String> user=<String>[];
  List<String> date=<String>[];
  List<String> status=<String>[];

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
