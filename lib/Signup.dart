import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:katheriniesorwutever/BottomNavigation.dart';
import 'package:katheriniesorwutever/StudentNavigation.dart';
import 'package:katheriniesorwutever/directorbottom.dart';
import 'package:katheriniesorwutever/profile.dart';
import 'package:katheriniesorwutever/tutordrawer.dart';
import 'login page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Signup extends StatefulWidget {
  Signup({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int _counter = 99713965;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController Confirm = TextEditingController();
  bool _validate = false;
  String test = "";
  bool _validatepass = false;
  String passerror = "";
  bool _confirmation = false;
  String confirmerror = "";
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
      MaterialPageRoute(builder: (context) => Login(title: 'Login')),
    );
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
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the Signup object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
        reverse: true,

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
                margin: EdgeInsets.only(top:10),
                height: 150,
                child:
                const Image(
                  image: NetworkImage('https://media.discordapp.net/attachments/857090756376526878/857817923963191306/aHR0cHM6Ly9zY29udGVudC1kZnc1LTIuY2RuaW5zdGFncmFtLmNvbS92L3Q1MS4yODg1LTE5LzE0MDIzMTAzM18xMTExMjc1ODA4.jpeg?width=630&height=630'),
                ),

              ),







               Column(
                children: [
                  Container(
                    height: 50,
                    width: 400,
                    margin: EdgeInsets.all(10),
                    child:  TextField(
                      scrollPadding: EdgeInsets.only(bottom:40),
                      controller: usernameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        errorText: _validate ? test : null,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    margin: EdgeInsets.all(10),
                    child:  TextField(
                      scrollPadding: EdgeInsets.only(bottom:40),
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        errorText: _validatepass ? passerror : null,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 400,

                    margin: EdgeInsets.all(10),
                    child:  TextField(
                      scrollPadding: EdgeInsets.only(bottom:40),
                      controller: Confirm,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                        errorText: _confirmation ? confirmerror : null,
                      ),
                    ),
                  ),



                          Container(
                            height: 50,
                            width: 400,

                            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom:0),
                            child: TextField(
                              scrollPadding: EdgeInsets.only(bottom:40),
                              controller: nameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Full Name',
                              ),
                            ),
                          )









                ],
              ),



            const SizedBox(height: 30),
               Container(





                width: 250,
                height: 50,
                margin: EdgeInsets.only(bottom:40),
                child: ElevatedButton(
                  onPressed: (){
                    usernameController.text.isEmpty ? _validate = true : _validate = false;
                    usernameController.text.isEmpty ? test = "This field is required" : test = "";
                    passwordController.text.isEmpty ? _validatepass = true : _validatepass = false;
                    passwordController.text.isEmpty ? passerror = "This field is required" : test = "";

                    _validatepass = false;
                    _validate = false;
                    _confirmation = false;
                    print(usernameController.text);
                  print(passwordController.text);
                  if(passwordController.text != Confirm.text){
                    _validatepass = true;
                    passerror = "the passwords don't match";
                    _confirmation = true;
                    confirmerror = "The Passwords don't Match";
                    setState(() {

                    });
                  }
                  if(passwordController.text == Confirm.text){
                    _validatepass = false;
                    _confirmation = false;





                  FirebaseAuth.instance.createUserWithEmailAndPassword(

                  email: usernameController.text, password: passwordController.text)
                    .then((value) {
                    print("User Uid: " + value.user!.uid);
                    // use Firebase Database
                          FirebaseDatabase.instance.reference().child("users/" + value.user!.uid).set(
                      {
                      "Name" : nameController.text,

                        }
                   ).then((value) {
                     print("works");
                        // go back to Login screen
                Navigator.push(
                       context,
                  MaterialPageRoute(builder: (context) => Login(title: 'Login Page')),
                  );
              }).catchError((e){
                    print("Failed to save the user information.");
                });
                  }).catchError((e) {
                print("Failed to sign up!");
              print(e);
                  //write errors here
                    if(e.toString().contains("email address is badly") ==true ){
                      print('yay');
                      _validate=true;
                      test = "Email is not valid";
                      setState(() {

                      });
                    }
                    if(e.toString().contains('6 characters')){
                      _validatepass=true;
                      passerror = "The passoword must be Six Characters Long";
                      setState(() {

                      });
                    }
                    if(e.toString().contains('already in use by another') == true){
                      _validate = true;
                      test = "This email is in use by another account";
                      setState(() {

                      });
                    }
              });};
                  setState(() {

                  });

                  },
                  //Navigator.push(
                  //context},
                  child: const Text('Sign Up'),),


              ),
            Container(
              child: ElevatedButton(
                child: Text('Sign up with Google'),
                onPressed: () async {
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
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
            )






          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
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

