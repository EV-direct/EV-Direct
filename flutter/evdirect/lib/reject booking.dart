import 'package:flutter/material.dart';

void main() {
  runApp(const RejectBooking());
}

class RejectBooking extends StatelessWidget {
  const RejectBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RejectBookingPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class RejectBookingPage extends StatefulWidget {
  const RejectBookingPage({super.key, required this.title});



  final String title;

  @override
  State<RejectBookingPage> createState() => _RejectBookingPageState();
}

class _RejectBookingPageState extends State<RejectBookingPage> {

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
