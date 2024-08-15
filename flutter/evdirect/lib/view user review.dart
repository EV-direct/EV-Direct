import 'dart:convert';
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
      home: const ViewUserReviewPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ViewUserReviewPage extends StatefulWidget {
  const ViewUserReviewPage({super.key, required this.title});



  final String title;

  @override
  State<ViewUserReviewPage> createState() => _ViewUserReviewPageState();
}

class _ViewUserReviewPageState extends State<ViewUserReviewPage> {
  _ViewUserReviewPageState(){
    get_data();
  }

  List<String> id_=<String>[];
  List<String> review_=<String>[];
  List<String> user_=<String>[];
  List<String> date_=<String>[];
  List<String> type_=<String>[];

  Future<void> get_data() async {
    List<String> id=<String>[];
    List<String> review=<String>[];
    List<String> user=<String>[];
    List<String> date=<String>[];
    List<String> type=<String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/worker_view_review/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        review.add(arr[i]['review']);
        user.add(arr[i]['user']);
        date.add(arr[i]['date']);
        type.add(arr[i]['type']);

      }

      setState(() {
        id_ = id;
        review_=review;
        user_=user;
        date_=date;
        type_=type;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.primary,

        leading: BackButton( color: Colors.white,),
        title: Text("User Reviews", style: TextStyle(color: Colors.white),),
      ),
      body:ListView.builder(
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

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ), Text(
                                    date_[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "User",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ), Text(
                                    user_[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Review",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ), Text(
                                    review_[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
      // ListView.builder(
      //   physics: BouncingScrollPhysics(),
      //   // padding: EdgeInsets.all(5.0),
      //   // shrinkWrap: true,
      //   itemCount: id_.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       onLongPress: () {
      //         print("long press" + index.toString());
      //       },
      //       title: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Card(
      //             child:
      //             Column(
      //               children: [
      //                 Padding(
      //                   padding: EdgeInsets.all(5),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text('Date'),
      //                       Text(date_[index]),
      //                     ],
      //                   ),
      //                 ),
      //
      //                 Padding(
      //                   padding: EdgeInsets.all(5),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text('User'),
      //                       Text(user_[index]),
      //                     ],
      //                   ),
      //                 ),
      //
      //                 Padding(
      //                   padding: EdgeInsets.all(5),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text('Review'),
      //                       Text(review_[index]),
      //                     ],
      //                   ),
      //                 ),
      //
      //               ],
      //             ),
      //
      //             elevation: 8,
      //             margin: EdgeInsets.all(10),
      //           )),
      //     );
      //   },
      // ),
    
    );
  }
}
