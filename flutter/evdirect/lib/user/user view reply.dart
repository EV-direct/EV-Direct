import 'dart:convert';
import 'package:evdirect/user/user%20sent%20complaint.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ViewUserReview());
}

class ViewUserReview extends StatelessWidget {
  const ViewUserReview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewuserreplyPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ViewuserreplyPage extends StatefulWidget {
  const ViewuserreplyPage({super.key, required this.title});



  final String title;

  @override
  State<ViewuserreplyPage> createState() => _ViewuserreplyPageState();
}

class _ViewuserreplyPageState extends State<ViewuserreplyPage> {
  _ViewuserreplyPageState(){
    get_data();
  }

  List<String> id_=<String>[];
  List<String> date_=<String>[];
  List<String> complaint_=<String>[];
  List<String> reply_=<String>[];

  Future<void> get_data() async {
    List<String> id=<String>[];
    List<String> date=<String>[];
    List<String> complaint=<String>[];
    List<String> reply=<String>[];




    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/usr_view_reply/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        date.add(arr[i]['date']);
        complaint.add(arr[i]['complaints']);
        reply.add(arr[i]['replay']);

      }

      setState(() {
        id_ = id;
        date_=date;
       complaint_=complaint;
        reply_=reply;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
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
          title: Text("Complaints About App", style: TextStyle(color: Colors.white),),

          backgroundColor: Theme.of(context).colorScheme.primary,

        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          // padding: EdgeInsets.all(5.0),
          // shrinkWrap: true,
          itemCount: id_.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onLongPress: () {
                print("long press" + index.toString());
              },
              title: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        child: Card(
                          elevation: 6,
                          margin: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date: " + date_[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Complaint: " + complaint_[index],
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Reply: " + reply_[index],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
floatingActionButton: FloatingActionButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => SendComplaint(title: ""),));
},child: Icon(Icons.add),),

      ),
    );
  }
}
