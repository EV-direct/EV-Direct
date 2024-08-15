import 'dart:convert';
import 'dart:io';

import 'package:evdirect/user/userview%20profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const Userupdateprofile());
}

class Userupdateprofile extends StatelessWidget {
  const Userupdateprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserupdateprofilePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class UserupdateprofilePage extends StatefulWidget {
  const UserupdateprofilePage({super.key, required this.title});



  final String title;
  @override
  State<UserupdateprofilePage> createState() => _UserupdateprofilePageState();
}

class _UserupdateprofilePageState extends State<UserupdateprofilePage> {
TextEditingController usernamecontroller = new TextEditingController();
TextEditingController emailcontroller = new TextEditingController();
TextEditingController placecontroller = new TextEditingController();
TextEditingController phonecontroller = new TextEditingController();
TextEditingController citycontroller = new TextEditingController();
TextEditingController statecontroller = new TextEditingController();
TextEditingController pincontroller = new TextEditingController();

final _formKey=GlobalKey<FormState>();

  String gender='';
  String uphoto='';
  _UserupdateprofilePageState(){
    _get_data();
  }

void _send_data() async{

  String name=usernamecontroller.text;
  String email=emailcontroller.text;
  String place=placecontroller.text;
  String phone=phonecontroller.text.toString();
  String city=citycontroller.text;
  String state=statecontroller.text;
  String pin=pincontroller.text.toString();


  SharedPreferences sh = await SharedPreferences.getInstance();
  String url = sh.getString('url').toString();
  String lid = sh.getString('lid').toString();

  final urls = Uri.parse('$url/usr_edit_profile/');
  try {

    final response = await http.post(urls, body: {
      "photo":photo,
      "uname":name,
      "email":email,
      "place":place,
      "phone":phone,
      "city":city,
      "state":state,
      "pin":pin,
      "gender":gender,
      "lid":lid,

    });
    if (response.statusCode == 200) {
      String status = jsonDecode(response.body)['status'];
      if (status=='ok') {

        Fluttertoast.showToast(msg: 'Updated Successfully');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => userprofilepageless(title: "Login"),));
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

void _get_data() async{



  SharedPreferences sh = await SharedPreferences.getInstance();
  String url = sh.getString('url').toString();
  String lid = sh.getString('lid').toString();
  String img_url = sh.getString('img_url').toString();

  final urls = Uri.parse('$url/usr_view_profile/');
  try {
    final response = await http.post(urls, body: {
      'lid':lid





    });
    if (response.statusCode == 200) {
      String status = jsonDecode(response.body)['status'];
      if (status=='ok') {
        String uname=jsonDecode(response.body)['uname'];
        String genderr=jsonDecode(response.body)['gender'];
        String email=jsonDecode(response.body)['email'];
        String phone=jsonDecode(response.body)['phone'];
        String place=jsonDecode(response.body)['place'];
        String city=jsonDecode(response.body)['city'];
        String pin=jsonDecode(response.body)['pin'];
        String state=jsonDecode(response.body)['state'];
        String photo=img_url+jsonDecode(response.body)['photo'];



        setState(() {

          usernamecontroller.text= uname;
          statecontroller.text= state;
          gender= genderr;
          emailcontroller.text= email;
          phonecontroller.text= phone;
          placecontroller.text= place;
          citycontroller.text= city;
          pincontroller.text= pin;
          uphoto= photo;
        });





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

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton( color: Colors.white,),

          backgroundColor: Theme.of(context).colorScheme.primary,

          title: Text("Update profile", style: TextStyle(color: Colors.white),),
        ),
        body: Center(

          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (_selectedImage != null) ...{
                    InkWell(
                      child:
                      Image.file(_selectedImage!, height: 400,),
                      radius: 399,
                      onTap: _checkPermissionAndChooseImage,
                      // borderRadius: BorderRadius.all(Radius.circular(200)),
                    ),
                  } else ...{
                    // Image(image: NetworkImage(),height: 100, width: 70,fit: BoxFit.cover,),
                    InkWell(
                      onTap: _checkPermissionAndChooseImage,
                      child:Column(
                        children: [
                          Image(image: NetworkImage(uphoto),height: 200,width: 200,),
                          Text('Select Image',style: TextStyle(color: Colors.cyan))
                        ],
                      ),
                    ),
                  },
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: usernamecontroller,
                      validator: (value)=>Validatename(value!),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: emailcontroller,
                      // validator: (value)=>Validateemail(value!),
                      validator: validateEmail,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: placecontroller,
                      validator: (value)=>Validateplace(value!),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Place',
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: phonecontroller,
                      // validator: (value)=>Validatephone(value!),
                      validator: validatePhoneNumber,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone no',
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: citycontroller,
                      validator: (value)=>Validatecity(value!),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: statecontroller,
                      validator: (value)=>Validatestate(value!),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'State',
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: pincontroller,
                      // validator: (value)=>Validatepin(value!),
                      validator: validatePin,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Pin',
                      ),
                    ),
                  ),

                  RadioListTile(value: "male", groupValue: gender, onChanged: (value){setState(() {gender="male";});},title: Text("male"),),
                  RadioListTile(value: "female", groupValue: gender, onChanged: (value){setState(() {gender="female";});},title: Text("female"),),
                  RadioListTile(value: "others", groupValue: gender, onChanged: (value){setState(() {gender="others";});},title: Text("others"),),

                  Container(
                      height:50,
                      padding:const EdgeInsets.fromLTRB(10,0,10,0,),
                      child: ElevatedButton(
                        child: const Text('Update'),
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {

                            _send_data();}
                        },
                      )
                  ),

                  // ListTile(
                  //   title: const Text('Male'),
                  //   leading: Radio<SingingCharacter>(
                  //     value: SingingCharacter.lafayette,
                  //     groupValue: _character,
                  //     onChanged: (SingingCharacter? value) {
                  //       setState(() {
                  //         _character = value;
                  //       });
                  //     },
                  //   ),
                  // ),



                  // ListTile(
                  //   title: const Text('female'),
                  //   leading: Radio<SingingCharacter>(
                  //     value: SingingCharacter.lafayette,
                  //     groupValue: _character,
                  //     onChanged: (SingingCharacter? value) {
                  //       setState(() {
                  //         _character = value;
                  //       });
                  //     },
                  //   ),
                  // ),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
File? _selectedImage;
String? _encodedImage;
Future<void> _chooseAndUploadImage() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    setState(() {
      _selectedImage = File(pickedImage.path);
      _encodedImage = base64Encode(_selectedImage!.readAsBytesSync());
      photo = _encodedImage.toString();
    });
  }
}

Future<void> _checkPermissionAndChooseImage() async {
  final PermissionStatus status = await Permission.mediaLibrary.request();
  if (status.isGranted) {
    _chooseAndUploadImage();
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Permission Denied'),
        content: const Text(
          'Please go to app settings and grant permission to choose an image.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

String photo = '';

String? Validatename(String value){
  if(value.isEmpty){
    return 'please enter a name';
  }
  return null;
}

// String? Validateemail(String value){
//   if(value.isEmpty){
//     return 'please enter email';
//   }
//   return null;
// }
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    // Regular expression for email validation
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // Return null if the entered email is valid
  }

String? Validateplace(String value){
  if(value.isEmpty){
    return 'please enter a place';
  }
  return null;
}
// String? Validatephone(String value){
//   if(value.isEmpty){
//     return 'please enter a phone number';
//   }
//   return null;
// }
  String? validatePhoneNumber(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }

    // Remove any non-numeric characters from the input
    String phoneNumber = value.replaceAll(RegExp(r'\D'), '');

    // Check if the length of the phone number is not equal to 10
    if (phoneNumber.length != 10) {
      return 'Mobile number must be 10 digits';
    }

    // Return null if the validation passes
    return null;
  }

String? Validatecity(String value){
  if(value.isEmpty){
    return 'please enter a city';
  }
  return null;
}String? Validatestate(String value){
  if(value.isEmpty){
    return 'please enter a state';
  }
  return null;
}

// String? Validatepin(String value){
//   if(value.isEmpty){
//     return 'please enter a pin';
//   }
//   return null;
// }
  String? validatePin(String? value) {
    // Check if the input value is empty
    if (value == null || value.isEmpty) {
      return 'Please enter a pin code';
    }

    // Check if the input value is not numeric
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter a valid pin code';
    }

    // Check if the length of the pin code is not equal to 6
    if (value.length != 6) {
      return 'Pin code must be 6 digits long';
    }

    // If all validations pass, return null
    return null;
  }

}
