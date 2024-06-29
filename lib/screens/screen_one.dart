import 'package:flutter/material.dart';
import 'globals.dart' as globals;




class FirstScreen extends StatefulWidget {
  final TabController tabController;
  const FirstScreen({Key? key, required this.tabController}) : super(key: key);
  State<FirstScreen> createState() => _FirstScreenPage();
}
class _FirstScreenPage extends State<FirstScreen> with SingleTickerProviderStateMixin{
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    tabController.dispose();
    super.dispose();
  }

  
  int globalint1 = 0;
  int globalint2 = 0;
  void conter() {
    setState(() {
      globalint1++;
    });
    print(globalint1);
  }

  void setuwu() {
    var yawar = int.parse(myController2.text);
    if (myController1.text == "Motor" || myController1.text == "motor"){
        yawar = yawar * 3000;
    } else if(myController1.text == "Mobil" || myController1.text == "mobil"){
      yawar = yawar * 5000;
    } else {
      yawar = yawar * 7000;
    }
    
    setState(() {
      globals.globalText = myController.text;
      globals.globalText1 = myController1.text;
      globals.globalText2 = myController2.text;
      globals.globalInt = '$yawar';
      globals.growableList.insert(globalint2, "User = " + globals.globalText + " Jenis Kendaraan = " + globals.globalText1 + 
      " jam Parkir = " + myController2.text + " Price = " + '$yawar');
    });
    print(globals.globalText);
    globalint2++;
    widget.tabController.animateTo(1);
    print(globals.growableList.map((quote) => Text(quote)).toList());
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Input Here"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        
        child: Column(
          
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
           children: [
 Container(
  color: Colors.green,
 width: 300,
 height: 400,
 margin: const EdgeInsets.all(40.0),
 child: Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
          const SizedBox(height: 30),
          Text(
            '$globalint1',
          ),
          const SizedBox(height: 30),
          
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: setuwu,
            child: const Text('Send'),
          ),
          TextField(
            controller: myController,
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
        ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: myController1,
            obscureText: false,
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Vehicle Type',
        ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: myController2,
            obscureText: false,
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Hour',
        ),
          ),
          
  ],
 ),
 ),
 Container(
  
 )
  ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ));
         
  }
  
}
class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Column(
        children: <Widget>[
          Text(
            "User = " + globals.globalText + " Pass = " + globals.globalText1 + 
      " Hour = " + globals.globalText2 + " Price = " + globals.globalInt
          ),
          ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
        ]
      ),
      ),
    );
  }
}


