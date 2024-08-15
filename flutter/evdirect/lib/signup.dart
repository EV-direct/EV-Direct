import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'login.dart';
void main() {
  runApp(const Signup());
}



class Signup extends StatelessWidget {


  const Signup({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WorkerSignupPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class WorkerSignupPage extends StatefulWidget {
  const WorkerSignupPage({super.key, required this.title});



  final String title;
  @override
  State<WorkerSignupPage> createState() => _WorkerSignupPageState();
}

class _WorkerSignupPageState extends State<WorkerSignupPage> {

  _WorkerSignupPageState(){
    getdata();
  }
  List<int> election_id_ = <int>[];
  List<String> election_name_ = <String>[];
  String dropdownValue1 ="";
TextEditingController usernamecontroller = new TextEditingController();
TextEditingController passwordcontroller = new TextEditingController();
TextEditingController confirmcontroller = new TextEditingController();
TextEditingController emailcontroller = new TextEditingController();
TextEditingController placecontroller = new TextEditingController();
TextEditingController phonecontroller = new TextEditingController();
TextEditingController citycontroller = new TextEditingController();
TextEditingController statecontroller = new TextEditingController();
TextEditingController pincontroller = new TextEditingController();

  final _formKey=GlobalKey<FormState>();

 String gender='male';
File? uploadimage;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.primary,

        leading: BackButton( color: Colors.white,),
        title: Text("Register as Worker", style: TextStyle(color: Colors.white),),
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
                        Image(image: NetworkImage('https://cdn.pixabay.com/photo/2017/11/10/05/24/select-2935439_1280.png'),height: 200,width: 200,),
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
                    controller: passwordcontroller,
                    obscureText: true,
                    // validator: (value)=>Validatepassword(value!),
                    validator: validatePassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: confirmcontroller,
                    obscureText: true,
                    validator: (value) => validateConfirmPassword(value, passwordcontroller.text),
                    // validator: (value)=>Validateconfirmpassword(value!),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: validateEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(':category        ',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                      DropdownButton<String>(
                        // isExpanded: true,
                        value: dropdownValue1,
                        onChanged: (String? value) {

                          print(dropdownValue1);
                          print("Hiiii");
                          setState(() {
                            dropdownValue1 = value!;
                          });
                        },
                        items: election_name_.map((String value) {
                          return DropdownMenuItem(

                            value: value,
                            child: Text(value,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                // backgroundColor: Colors.brown,
                              ),),
                          );
                        }).toList(),
                      ),

                    ],
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
                    keyboardType: TextInputType.phone, // Specify keyboard type for numeric input
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
                    keyboardType: TextInputType.number,
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
                      child: const Text('Signup'),
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
    
    );
  }
  void getdata() async{
    List<int> election_id = <int>[];
    List<String> election_name = <String>[];


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    final urls = Uri.parse('$url/view_category_worker/');


    var data = await http.post(urls, body: {});
    var jsondata = json.decode(data.body);
    String status = jsondata['status'];

    var arr = jsondata["data"];


    for (int i = 0; i < arr.length; i++) {
      election_id.add(arr[i]['id']);
      election_name.add(arr[i]['category']);
    }
    setState(() {
      election_id_ = election_id;
      election_name_ = election_name;
      dropdownValue1= election_name_.first;
    });
  }
void _send_data() async{

  String name=usernamecontroller.text;
  String password=passwordcontroller.text.toString();
  String confirm=confirmcontroller.text.toString();
  String email=emailcontroller.text;
  String place=placecontroller.text;
  String phone=phonecontroller.text.toString();
  String city=citycontroller.text;
  String state=statecontroller.text;
  String pin=pincontroller.text.toString();


  SharedPreferences sh = await SharedPreferences.getInstance();
  String url = sh.getString('url').toString();

  final urls = Uri.parse('$url/worker_signup/');
  try {

    final response = await http.post(urls, body: {
      "photo":photo,
       "wname":name,
      "password":password,
      "confirm_password":confirm,
      "email":email,
      "place":place,
      "phone":phone,
      "city":city,
      "state":state,
      "pin":pin,
      "gender":gender,
      "category":election_id_[ election_name_.indexOf(dropdownValue1)].toString()

    });
    if (response.statusCode == 200) {
      String status = jsonDecode(response.body)['status'];
      if (status=='ok') {

        Fluttertoast.showToast(msg: 'Registration Successfull');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => LoginPage(title: "Login"),));
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
  // String? Validatepassword(String value){
  //   if(value.isEmpty){
  //     return 'please enter a password';
  //   }
  //   return null;
  // }String? Validateconfirmpassword(String value){
  //   if(value.isEmpty){
  //     return 'please confirm password';
  //   }
  //   return null;
  // }

  // String? validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter a password';
  //   }
  //
  //   // Add additional password requirements as needed
  //   // For example, check for minimum length, special characters, etc.
  //
  //   return null;
  // }



  String? validatePassword(String? value) {
    // Check if the input value is empty
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    // Check if the password length is less than 6 characters
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    // If all validations pass, return null
    return null;
  }



  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    // Check if the confirm password matches the original password
    if (value != password) {
      return 'Passwords do not match';
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
  }
  String? Validatestate(String value){
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

