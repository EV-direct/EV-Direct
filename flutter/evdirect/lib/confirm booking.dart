import 'package:flutter/material.dart';

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

  void _incrementCounter() {
    setState(() {


    });
  }

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


          ],
        ),
      ),
    
    );
  }
}
