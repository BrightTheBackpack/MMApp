

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:katheriniesorwutever/login%20page.dart';
import 'HomePage.dart';
import 'BottomNavigation.dart';
import 'login page.dart';
import 'Signup.dart';
import 'firebase_options.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() async{
 // FlutterError.onError = (FlutterErrorDetails details) {
   // FlutterError.dumpErrorToConsole(details);

  //};
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'mathmattersapp',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math Matters App',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
        buttonColor: Colors.red,     //  <-- dark color
        textTheme: ButtonTextTheme.primary,
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}


class _WelcomePageState extends State<WelcomePage> {
  int _counter = 99713965;
  void initState() {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).whenComplete(() {
      print("completed");
      setState(() {});
    });

  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.flutterfire configure --project=mathmattersapp
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

             Container(
               margin:EdgeInsets.only(top:200),


                width: 200, height:200, child:Image.network("https://cdn.discordapp.com/attachments/857090756376526878/857817923963191306/aHR0cHM6Ly9zY29udGVudC1kZnc1LTIuY2RuaW5zdGFncmFtLmNvbS92L3Q1MS4yODg1LTE5LzE0MDIzMTAzM18xMTExMjc1ODA4.jpeg"),
            ),


            Container(
              margin: EdgeInsets.only(top: 30),
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: 'Sign In')),
                );},
                child:
                const Text('Sign In' ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white,), //button color
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black), //text (and icon)
                ),



              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Signup(title: 'Sign Up')));
                },
                child:
                const Text('Sign Up' ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white,), //button color
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black), //text (and icon)
                ),



              ),
            ),
            Expanded(flex: 5, child: Text(''))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}