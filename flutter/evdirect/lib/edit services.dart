import 'package:flutter/material.dart';

void main() {
  runApp(const EditService());
}

class EditService extends StatelessWidget {
  const EditService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EditServicePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class EditServicePage extends StatefulWidget {
  const EditServicePage({super.key, required this.title});



  final String title;

  @override
  State<EditServicePage> createState() => _EditServicePageState();
}

class _EditServicePageState extends State<EditServicePage> {
TextEditingController servicecontroller = new TextEditingController();
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
            Container(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: servicecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Service',
                ),
              ),
            ),

            Container(
                height:48,
                padding:const EdgeInsets.fromLTRB(8,0,10,0,),
                child: ElevatedButton(
                  child: const Text('Edit'),
                  onPressed: () {

                  },
                )
            ),

          ],
        ),
      ),

    );
  }
}
