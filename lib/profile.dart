import 'dart:async';
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:katheriniesorwutever/StudentNavigation.dart';
import 'package:katheriniesorwutever/directorbottom.dart';
import 'package:katheriniesorwutever/main.dart';
import 'package:katheriniesorwutever/schudule.dart';
import 'package:katheriniesorwutever/tutordrawer.dart';
//import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'HomePage.dart';
import 'schudule.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'BottomNavigation.dart';
import 'package:firebase_database/firebase_database.dart';
class profile extends StatefulWidget {
  profile({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController _controller = new TextEditingController();
  String dropdownValue = 'Student';
  TextEditingController NameController1 = new TextEditingController();
  int _counter = 0;
  var _selectedIndex = 1;
  String Typetest = "";

  int length = 0;
  int ha = 0;
  var kidsBooks;
  late List<String> items;
  final List<DropdownMenuItem> item = [];
  String _currentSugars = "";
  int schools = 0;
  Widget day2 = SizedBox();
  bool isdirector = false;
   Widget otherschool = Container();


  late List<Widget> _widgetoption;
  TextEditingController SchoolController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController GradeController = TextEditingController();
  String name = "";
  late String _now;
  TextEditingController school = TextEditingController();
  late Timer _everySecond;
  void initState() {

    FirebaseDatabase.instance.reference().child("users/" + FirebaseAuth.instance.currentUser!.uid).once().then((value)
    {
      print(FirebaseAuth.instance.currentUser!.uid);
      print(value.snapshot.value);

      var temp2 = value.snapshot.value as Map<String, dynamic>;
      //var temp = json.decode(value.snapshot.value.toString()).toList();

      school.text = temp2['School']!;
      NameController.text = temp2['Day']!;
      GradeController.text = temp2['Grade']!;
      dropdownValue = temp2['type']!;
      print(dropdownValue + 'test');
      if(dropdownValue.contains('irector')){
        isdirector == true;
      }

      name = temp2['Name']!;



    }

    );


    FirebaseDatabase.instance.reference().child("schools").once().then((value){
     // print(value);
      items = [];
      var test = value.snapshot.value;
      print(value.snapshot.value);
      var temp = value.snapshot.value as List<dynamic>;
      //var temp = json.decode(value.snapshot.value.toString()).toList();
      for(int i =0; i< temp.length; i++){
        print(i);

        items.add(temp[i].toString());

      }
      items.add('School not Found? Click Here');
      print(items.toString());
      // ignore: unnecessary_statements






    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      for(int i = 0; i<items.length; i++){
        schools=i;


      }
      print(item);
      setState(() {

      });
    });







  }



  @override


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    print(dropdownValue);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

        Container(margin:EdgeInsets.only(top:50),child: Text('Profile', style: TextStyle(fontSize: 50),)),

        DropdownButton<String>(
          value: dropdownValue,

          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(
              color: Colors.deepPurple
          ),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              print(dropdownValue + "hihihii");
            });
          },
          items: <String>['Student', 'Tutor', 'Co-Director']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
              .toList(),
        ),

            DropdownSearch<String>(

             onSaved: (String? a){
               print('onsaved');
               if(a != null){
                 items.add(a);
               }
             },
              onChanged: (String? a){
               print(a.toString());
               if(a.toString().contains('School not Found?')){
                 otherschool = Container(
                   child: TextField(
                     controller: school,
                     decoration: InputDecoration(

                       hintText: 'School'
                     ),
                   )
                 );
                 setState(() {

                 });
               }else {
                 school.text = a!;
               }

              },



              popupProps: PopupProps.menu(
                searchDelay: Duration(seconds: 0),

                showSelectedItems: true,
                showSearchBox: true,

              ),
              items: items,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Select a School",
                  hintText: "Select a School",

                ),
              ),
              selectedItem: school.text,


            ),
            otherschool,
            /*
            Container(
              margin: EdgeInsets.only(top: 100),
              child: SearchableDropdown.single(
                items: item,
                value: school.text,
                hint: "Select one",
                searchHint: "Select one",

                onChanged: (value) {
                  String textdia = DropdownDialog.txtSearch;
                  if(textdia == null){
                    textdia = "";
                  }

                    setState(() {
                      item.add(
                          DropdownMenuItem(
                            child: Text(textdia),
                            value: textdia,
                          )
                      );

                      school.text = value;
                    });



                },
                isExpanded: true,
              ),
            ),
  */

            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: GradeController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Grade',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: NameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Assigned Day',
                ),
              ),
            ),
            day2,
            TextButton(onPressed:(){
              day2 = Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: NameController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Second Assigned Day',
                  ),
                ),
              );
              setState(() {

              });
            }, child: Text('+ Add more days')),
            ElevatedButton(onPressed: (){
              print('Print');
              if(!items.contains(school.text)){
                int index = items.length -1;

                FirebaseDatabase.instance.ref().child('schools').update(
                  {
                    index.toString() : school.text
                  }

                );

              }
              if(dropdownValue=="Co-Director"&&isdirector==true){
                FirebaseDatabase.instance.reference().child("users/" + FirebaseAuth.instance.currentUser!.uid.toString()).update(
                    {
                      "Grade" : GradeController.text,
                      "Day" : NameController.text,

                      "School" : school.text,
                      "type" : dropdownValue
                    }
                ).then((value) {
                  // go back to Login screen
                  print("sucess");

                }).catchError((e){
                  print("Failed to save the user information." + e.toString());
                });
                if(NameController1.text != null){
                  FirebaseDatabase.instance.reference().child("Co-Director/" + name).update({
                    "Second Day" : NameController1.text,
                  });
                }
                FirebaseDatabase.instance.reference().child("Co-Director/" + name).update(
                    {
                      "Grade" : GradeController.text,
                      "Day" : NameController.text,
                      "School" : school.text
                    }
                ).then((value) {
                  // go back to Login screen

                  print("sucess");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => directorNavigation(title: 'Home')),
                  );
                }).catchError((e){
                  print("Failed to save the user information." + e.toString());
                });
              }
              if (dropdownValue == "Tutor"||dropdownValue=="Co-Director"&&isdirector==false)[
              FirebaseDatabase.instance.reference().child("users/" + FirebaseAuth.instance.currentUser!.uid.toString()).update(
              {
              "Grade" : GradeController.text,
              "Day" : NameController.text,

              "School" : school.text,
              "type" : "Tutor"
              }
              ).then((value) {
              // go back to Login screen
              print("sucess");

              }).catchError((e){
              print("Failed to save the user information." + e.toString());
              }),
              if(NameController1.text != null){
              FirebaseDatabase.instance.reference().child("tutors/" + name).update({
              "Second Day" : NameController1.text,
              }).then((value){

              })
              },
              FirebaseDatabase.instance.reference().child("tutors/" + name).update(
              {
              "Grade" : GradeController.text,
              "Day" : NameController.text,
              "School" : school.text
              }
              ).then((value) {
              // go back to
                // Login screen
                final snackBar = SnackBar(
                  content: const Text('Success!'),

                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

              print("sucess");
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
              }).catchError((e){
              print("Failed to save the user information." + e.toString());
              })

              ];
              // ignore: unnecessary_statements

              if (dropdownValue.contains('tud') )[
              FirebaseDatabase.instance.reference().child("users/" + FirebaseAuth.instance.currentUser!.uid.toString()).update(
              {
              "Grade" : GradeController.text,
              "Day" : NameController.text,

              "School" : school.text,
              "type" : dropdownValue
              }
              ).then((value) {
              // go back to Login screen
              print("sucess");

              }).catchError((e){
              print("Failed to save the user information." + e.toString());
              }),
              if(NameController1.text != null){
              FirebaseDatabase.instance.reference().child("Co-Director/" + name).update({
              "Second Day" : NameController1.text,
              }),
              },
                FirebaseDatabase.instance.reference().child("Student/" + name).update(
                    {
                      "Grade" : GradeController.text,
                      "Day" : NameController.text,
                      "School" : school.text
                    }
                ).then((value) {
                  // go back to Login screen
                  print("sucess");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudentNav(title: 'Home')),
                  );
                }).catchError((e){
                  print("Failed to save the user information." + e.toString());
                })

              ];





            }, child: Text('Save')),

          ],
        ),
      ),
      //
    );

  }
}
