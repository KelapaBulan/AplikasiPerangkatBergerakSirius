import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class SecondScreen extends StatefulWidget {
  final TabController tabController;
  const SecondScreen({Key? key, required this.tabController}) : super(key: key);

  State<SecondScreen> createState() => _SecondScreenPage();
}
  void sorty() {
      globals.growableList.sort((a, b) => a.compareTo(b));
    }
 class _SecondScreenPage extends State<SecondScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
  void initState() {
    tabController = TabController(length: 4, initialIndex: 0, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    tabController.dispose();
    super.dispose();
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
        title: Text("Output"),
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
 width: 400,
 height: 450,
 margin: const EdgeInsets.all(40.0),
 child: Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
          /* ElevatedButton(
            style: style,
            onPressed: ,
            child: const Text('Send'),
          ),*/
          const SizedBox(height: 30),
          Text(
            globals.globalText,
          ),
          const SizedBox(height: 30),
          Text(
            globals.globalText1,
          ),
          Column(
          children: globals.growableList.map((quote) => Text(quote)).toList(),
          ),
          ElevatedButton(
            style: style,
            onPressed: (){
              widget.tabController.animateTo(0);
            },
            child: const Text('Back'),
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
  

