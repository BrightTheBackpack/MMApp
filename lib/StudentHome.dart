import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:katheriniesorwutever/FeedbackPage.dart';
import 'package:katheriniesorwutever/schudule.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'dart:async';
class StudentHome extends StatefulWidget {
  StudentHome({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  Future<void> _launchURL() async {
    String url = 'https://www.mathmatters4all.org/';
    if (!url.contains('http')) url = 'https://$url';


    launch(url);
  }

  var _selectedIndex = 0;
  late List<Widget> _widgetoption;
  @override
  void initState(){

    super.initState();
    _widgetoption = [StudentHome(title: 'wut')];


  }


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      backgroundColor: Color(0xff00104e),
      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Container(width:200, height:200,child:Image.network('https://media.discordapp.net/attachments/857090756376526878/857817923963191306/aHR0cHM6Ly9zY29udGVudC1kZnc1LTIuY2RuaW5zdGFncmFtLmNvbS92L3Q1MS4yODg1LTE5LzE0MDIzMTAzM18xMTExMjc1ODA4.jpeg?width=630&height=630')),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(onPressed: _launchURL, child: Text('Our Website')),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(onPressed: (){
                  {
                    String url = 'https://www.instagram.com/mathmatters4all/';
                    if (!url.contains('http')) url = 'https://$url';


                    launch(url);
                  }

                }, child: Text('Instagram')),

              ],
            ),

            //   Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
//
            //            children: [
//
            //             ElevatedButton(onPressed: (){
            //             {
            //             Navigator.push(
            //             context,
            //           MaterialPageRoute(builder: (context) => FeedbackPage(title: 'Login and Signup')),
            //       );
            //   }

            //     }, child: Text('Feedback Page')),
//
            //            ],
            //        ),









          ],

        ),

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}