import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:katheriniesorwutever/HomePage.dart';
import 'package:katheriniesorwutever/Signup.dart';
import 'package:katheriniesorwutever/StudentNavigation.dart';
import 'package:katheriniesorwutever/directorbottom.dart';
import 'package:katheriniesorwutever/sign_in_with_google.dart';
import 'package:katheriniesorwutever/tutordrawer.dart';
import 'HomePage.dart';
import 'BottomNavigation.dart';
import 'Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import  'profile.dart';
//todo
//add scroll//done
//add forgor password//done

class Login extends StatefulWidget {
  Login({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  int _counter = 99713965;
  String type = "";
  String Typetest = "";
  TextEditingController lusernameController = TextEditingController();
  TextEditingController lpasswordController = TextEditingController();
  String valll = "";
  bool _validate = false;
  String test = "";
  bool _validatepass = false;
  var color1 = Colors.blue;
  var color2 = Colors.white;
  bool resetpasss = true;
  String resetpass = "Forgot Password? Click here to reset your password ";
  String passerror = "";
  void initState() {

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
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => bottomNavigation(title: 'Homepage')),
    );
  }
  /*
  void _signupbutton() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Signup(title: 'Sign Up')),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the Login object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
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


               Container(
                height: 150,
                margin: EdgeInsets.only(bottom:30),
                child:
                const Image(
                  image: NetworkImage('https://media.discordapp.net/attachments/857090756376526878/857817923963191306/aHR0cHM6Ly9zY29udGVudC1kZnc1LTIuY2RuaW5zdGFncmFtLmNvbS92L3Q1MS4yODg1LTE5LzE0MDIzMTAzM18xMTExMjc1ODA4.jpeg?width=630&height=630'),
                ),

              ),

             Container(
               margin: EdgeInsets.only(left:10, right: 10,),
               child: TextField(

                 controller: lusernameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  errorText: _validate ? test : null,
                ),
            ),
             ),
             Container(
               margin: EdgeInsets.only(top:10, left: 10, right: 10,),

               child: TextField(
                 controller: lpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  errorText: _validatepass ? passerror : null,
                ),
            ),
             ),
            const SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 300,
              height: 50,
              child: ElevatedButton(


                onPressed: (){
                  lusernameController.text.isEmpty ? _validate = true : _validate = false;
                  lusernameController.text.isEmpty ? test = "This field is required" : test = "";
                  lpasswordController.text.isEmpty ? _validatepass = true : _validatepass = false;
                  lpasswordController.text.isEmpty ? passerror = "This field is required" : test = "";




                  FirebaseDatabase.instance.reference().child("users/7OpFqquVBBhyw7AhNRqRF7l4z5I3/type").once().then((result){

                    print(result.snapshot.value.toString());
                    var temp = result.snapshot.value as Map<String, dynamic>;


                    temp.forEach((key, value) {
                      print(key + "key");
                      print(value + "val");
                      valll = value;
                      });

                    // refresh the UI - ListView based on the new data
                    setState(() {

                    });

                  }).catchError((e) {
                    print('failed');





                  });
                  if(_validate == false) {
                    if(_validatepass == false) {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: lusernameController.text,
                          password: lpasswordController.text).then((value) {
                            print(value.user!.uid);
                        print("Successfully signed in!");
                        type = value.user!.uid;
                            print('here');



                      FirebaseDatabase.instance.ref().child("users/" + type + "/type").once().then((value)
                      {
                        Typetest = value.snapshot.value.toString();
                        print(value.toString());
                        print("hi");
                        print(Typetest);


                      }
                      );
                      print('itreachedhere');
                      Future.delayed(const Duration(milliseconds: 1000), (){
                        print('andnowhere');

                        if(Typetest == "null"){
                          print("null");
                          Navigator.push(
                            context,

                            MaterialPageRoute(builder: (context) =>
                                profile(title: 'Login')),
                          );}
                          if(Typetest.contains('ut') == true){
                            print("succsesss");

                            if(kIsWeb){
                              Navigator.push(
                                context,

                                MaterialPageRoute(builder: (context) =>
                                    drawer(title: 'HomePage')),
                              );
                            }else{
                              Navigator.push(
                                context,

                                MaterialPageRoute(builder: (context) =>
                                    bottomNavigation(title: 'HomePage')),
                              );
                            }

                          }
                          if(Typetest.contains('tud') == true){
                            Navigator.push(
                              context,

                              MaterialPageRoute(builder: (context) =>
                                  StudentNav(title: 'Login')),
                            );
                          }
                          if(Typetest.contains('irector')){
                            Navigator.push(
                              context,

                              MaterialPageRoute(builder: (context) =>
                                  directorNavigation(title: 'Login')),
                            );
                          }
                          }
                        );
                      }).catchError((e) {
                        Text("Failed to sign up!");
                        print(e);
                        print(e);
                        if (e.toString().contains('password') == true) {
                          print('YAY');
                          _validatepass = true;
                          passerror = "Wrong Password";
                        };
                        if (e.toString().contains('blocked all requests') ==
                            true) {
                          print('yay');
                          _validatepass = true;
                          passerror =
                          "Too many login attempts, try again later";
                          _validate = true;
                          test = "Too many login attempts, try again later";
                        };
                        if (e.toString().contains(
                            'email address is badly formatted') == true) {
                          _validate = true;
                          test = "The email address is incorrect";
                        }
                        if (e.toString().contains(
                            'no user record corresponding to this identifier') ==
                            true) {
                          _validate = true;
                          test =
                          "Account not found. Make sure your email is typed correctly";
                        }


                        setState(() {

                        });
                      });
                      ;
                      print('confirm');
                    }
                  }
                  setState(() {

                  });
                 // Navigator.push(
                  //  context,

                    //MaterialPageRoute(builder: (context) =>
                      //  profile(title: 'Login')),
                  //);

                },
                child: const Text('Login'),),
            ),
            ElevatedButton(

                style: ElevatedButton.styleFrom(

                    primary: color1,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                        color: color2,
                        fontSize: 14,
                        )),

              onPressed: (){
                lusernameController.text.isEmpty ? _validate = true : _validate = false;
                lusernameController.text.isEmpty ? test = "This field is required" : test = "";
                if(resetpasss == true && _validate == false){
                  FirebaseAuth.instance.sendPasswordResetEmail(email: lusernameController.text).catchError((e){
                    if (e.toString().contains('password') == true) {
                      print('YAY');
                      _validatepass = true;
                      passerror = "Wrong Password";
                    };
                    if (e.toString().contains('blocked all requests') ==
                        true) {
                      print('yay');
                      _validatepass = true;
                      passerror =
                      "Too many login attempts, try again later";
                      _validate = true;
                      test = "Too many login attempts, try again later";
                    };
                    if (e.toString().contains(
                        'email address is badly formatted') == true) {
                      _validate = true;
                      test = "The email address is not valid";
                    }
                    if (e.toString().contains(
                        'no user record corresponding to this identifier') ==
                        true) {
                      _validate = true;
                      test =
                      "Account not found. Make sure your email is typed correctly";
                    }
                    if(_validate == false){
                      setState(() {
                        color1 = Colors.grey;
                        resetpasss = false;
                        resetpass = "Check Your Email for Password Reset Link";
                        color2 = Colors.blueGrey;
                      });

                    }
                    setState(() {

                    });

                  });
                  setState(() {




                  });
                }else{
                  print('itworked');
                  null;
                }
                setState(() {

                });

              },

             child: Text(resetpass)),
            const SizedBox(height:30 ),
            ElevatedButton(onPressed:() async {
              User? user = await Authentication.signInWithGoogle(context: context);
              if(user != null){
                print('signed in');
                String Typetest = "";

                var type = user!.uid;
                print('here');



                FirebaseDatabase.instance.ref().child("users/" + type + "/type").once().then((value)
                {
                  Typetest = value.snapshot.value.toString();
                  print(value.toString());
                  print("hi");
                  print(Typetest);


                }
                );
                print('itreachedhere');
                Future.delayed(const Duration(milliseconds: 1000), (){
                  print('andnowhere');

                  if(Typetest == "null"){
                    print("null");
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (context) =>
                          profile(title: 'Login')),
                    );}
                  if(Typetest.contains('ut') == true){
                    print("succsesss");

                    if(kIsWeb){
                      Navigator.push(
                        context,

                        MaterialPageRoute(builder: (context) =>
                            drawer(title: 'HomePage')),
                      );
                    }else{
                      Navigator.push(
                        context,

                        MaterialPageRoute(builder: (context) =>
                            bottomNavigation(title: 'HomePage')),
                      );
                    }

                  }
                  if(Typetest.contains('tud') == true){
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (context) =>
                          StudentNav(title: 'Login')),
                    );
                  }
                  if(Typetest.contains('irector')){
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (context) =>
                          directorNavigation(title: 'Login')),
                    );
                  }
                }
                );

              }
            } , child: Text("Sign in with Google")),
            const SizedBox(height: 30),



          ],
        ),
      ),

    );
  }
}
class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try {
        final UserCredential userCredential = await auth.signInWithPopup(authProvider);
        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential = await auth.signInWithCredential(credential);
          user = userCredential.user;


        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // Handle account already exists with a different credential
          } else if (e.code == 'invalid-credential') {
            // Handle invalid credential
          }
        } catch (e) {
          // Handle other errors
        }
      }
    }

    return user;
  }
}
