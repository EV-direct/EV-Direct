import 'package:evdirect/view%20profile.dart';
import 'package:evdirect/view%20services.dart';
import 'package:evdirect/view%20user%20booking.dart';
import 'package:evdirect/view%20user%20review.dart';
import 'package:evdirect/view%20verified%20user%20bookings.dart';
import 'package:flutter/material.dart';

import 'add services.dart';
import 'change password.dart';
import 'login.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WorkerHomepage(title: 'Flutter Demo Home Page'),
    );
  }
}
class WorkerHomepage extends StatefulWidget {
  const WorkerHomepage({super.key, required this.title});



  final String title;

  @override
  State<WorkerHomepage> createState() => _WorkerHomepageState();
}

class _WorkerHomepageState extends State<WorkerHomepage> {

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
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProfilePage(title: '',)));
            }, child: Text("View profile")),
            SizedBox(height: 15,) ,

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAddServicePage(title: '',)));
            }, child: Text("Add service")),
            SizedBox(height: 15,) ,



            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewServicesPage(title: '',)));
            }, child: Text("View services")),
            SizedBox(height: 15,) ,

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUserBookingPage(title: '',)));
            }, child: Text("view user booking")),
            SizedBox(height: 15,) ,


            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewVerifiedUserBookingPage(title: '',)));
            }, child: Text("View verified user booking")),
            SizedBox(height: 15,) ,

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUserReviewPage(title: '',)));
            }, child: Text("View user review")),
            SizedBox(height: 15,) ,

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyChangePasswordPage(title: '',)));
            }, child: Text("Change password")),
            SizedBox(height: 15,) ,

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(title: '',)));
            }, child: Text("Login")),
            SizedBox(height: 15,) ,








          ],
        ),
      ),

    );
  }
}
