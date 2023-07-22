

//import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:katheriniesorwutever/StudentNavigation.dart';
import 'package:katheriniesorwutever/main.dart';
import 'package:katheriniesorwutever/schudule.dart';
import 'package:katheriniesorwutever/tutordrawer.dart';
//import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'HomePage.dart';
import 'schudule.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
//attendance.dart, feedbakcs.dart, hourcounter.dart
import 'BottomNavigation.dart';
import 'package:dropdown_search/dropdown_search.dart';


class attend extends StatefulWidget {
  attend({Key? key, required this.title}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and flutter create --platforms web .
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _attendState createState() => _attendState();
}

class _attendState extends State<attend> {
  //attendance page

  int counter = 1;
  bool validate = true;
  String type = "";
  List<String> newnames = [];
  List<String> tutors =[];
  List<String> displayedtutors = [];
  final ref = FirebaseDatabase.instance.ref();
  var uid = FirebaseAuth.instance.currentUser?.uid;
  List tutors2 = [];
  List names = [];
  List<String> addedtutors = [];
  final List<String> items = [];
  void initState() {
    //get user's name from database
    FirebaseDatabase.instance.ref().child("users/" +FirebaseAuth.instance.currentUser!.uid+"/").get().then((value){
     print(value.value.toString());
      var temp = value.value as Map<String, dynamic>;
     name = temp['Name'];
    });
    //get list of students from database
    FirebaseDatabase.instance.ref().child("Student").once().then((
        result) {
      List<String> codelistfromfb = [];
      var temp = result.snapshot.value as Map<String, dynamic>;
      temp.forEach((key,value) {
        codelistfromfb.add(key.toString());
      });
      names = codelistfromfb;
      newnames = (names as List<String>?)!;
     ;
      setState(() {
      });
    }).catchError((e) {
    });
//get tutor list from datababase
    FirebaseDatabase.instance.ref().child("tutors").once().then((
        result) {
      List<String> codelistfromfb = [];
      var temp = result.snapshot.value as Map<String, dynamic>;
      temp.forEach((key,value) {
        codelistfromfb.add(key.toString());
      });
      tutors2 = codelistfromfb;
      print(tutors2.toString() + "2");
      tutors = (tutors2 as List<String>?)!;
      print(tutors.toString()+"1");
      ;
      setState(() {
      });
    }).catchError((e) {
    });
    int number = 0;
    Future.delayed(const Duration(milliseconds: 1000), () {
      //prepare student list for Dropdown Search
      String wordPair = "";
      while (number < newnames.length) {
        items.add(newnames[number].toString());
        number++;
        setState(() {
        });
      };
    });
    super.initState();
    //get counter for Progress Tracker
    FirebaseDatabase.instance.ref()
        .child("counter" )
        .once()
        .then((res) {
          var temp = res.snapshot.value as Map<String, dynamic>;
         counter = temp['count'];
    }).catchError((e) {
    }
    );
  }
  List codeList = [];
  List codeDate = [];
  List<int> delete = [];
  var length = 1;
  String t = "true";
  var name = "";
  String errortext = "";
  String test = "";
  String day = "";
  String month = "";
  List<String> students = [];
  String dropdownValue = 'Student';
  int _counter = 0;
  var _selectedIndex = 1;
  late List<Widget> _widgetoption;
  TextEditingController HoursController = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController StudentController = TextEditingController();
  TextEditingController contenttracker = TextEditingController();
  List<TextEditingController> contentracker = [TextEditingController(),TextEditingController(), TextEditingController(),];
  DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String textdate = DateTime.now().year.toString() + "-" + DateTime.now().month.toString() + "-" + DateTime.now().day.toString();
  int hours = 0;
  @override
  //method for date selector
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    if(selectedDate.day.toString().length == 1){
      day = "0"+selectedDate.day.toString();
    }else{
      day = selectedDate.day.toString();
    }
    if(selectedDate.month.toString().length == 1){
      month = "0"+selectedDate.month.toString();
    }else{
      month = selectedDate.month.toString();
    }
    textdate = selectedDate.year.toString()+ '-' + month + "-" + day;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: <Widget>[
            //Instructions
            Text("Select the student(s) you taught, enter their content trackers, and select the date, then click save.", style: TextStyle(fontWeight: FontWeight.bold)),
            //Student Name Selector
            Container(
                margin: EdgeInsets.only(top: 100),
                child: DropdownSearch<String>.multiSelection(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          hintText: 'Select Student Names'
                      )
                  ),
                  items: items,
                  popupProps: PopupPropsMultiSelection<String>.menu(
                    showSelectedItems: true,
                    searchDelay: Duration(seconds: 0),
                    showSearchBox: true,
                  ),
                  onChanged:(List<String> test){
                    setState(() {
                      //print(test);
                      students = test;
                      //print(students);
                      //print(students.length);
                    });
                  },
                  selectedItems: students,
                )
            ),
            //Addition Tutor Selector
            Container(
                margin: EdgeInsets.only(top: 100),
                child: DropdownSearch<String>.multiSelection(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          hintText: 'Additional Tutors'
                      )
                  ),
                  items: tutors,
                  popupProps: PopupPropsMultiSelection<String>.menu(
                    showSelectedItems: true,
                    showSearchBox: true,
                    searchDelay: Duration(seconds: 0),
                    disabledItemFn: (String s) => s.startsWith(name),
                  ),
                  onChanged:(List<String> test){
                    setState(() {
                      //print(test);
                      addedtutors = test;
                      addedtutors.add(name);
                      //print(students);
                      //print(students.length);
                    });
                  },
                  selectedItems: displayedtutors,
                )
            ),
            //Progress Tracker
            Container(
              height: students.length *100,
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      width: 400,
                      height: 100,

                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          hintText: 'Write what you taught today here',
                          labelText: 'Student Content Tracker for ' + students[index],
                        ),
                        controller:contentracker[index] ,
                        maxLines: 6,
                      ),
                    );
                  }
              ),
            ),
            //Date Selector
            Container(width:400, height:50,margin: EdgeInsets.all(10),child: TextButton(onPressed: ()=> _selectDate(context), child: Text(textdate.toString()))),
            //save button
            Container(
              width: 400,
              height: 50,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Save"),
                onPressed: (){
                  //Adds Info to attendance log
                  FirebaseDatabase.instance.ref().child("AttendanceLog/" +  counter.toString()+"/Info").set({
                    "Name": name,
                    "Hours" : HoursController.text,
                    "Date" : selectedDate.year.toString()+ '-' + selectedDate.month.toString() + "-" + selectedDate.day.toString(),
                  }).then((value) {
                    //Adds all additional Tutors to attendance log
                    for(int i = 0; i < addedtutors.length; i++){
                      FirebaseDatabase.instance.ref().child("AttendanceLog/"+counter.toString()+'/Info').set({
                        'Date' : selectedDate.year.toString() + '-' + selectedDate.month.toString() + '-' + selectedDate.day.toString(),
                        'Hours' : '2',
                        'Name' : addedtutors[i],
                      });
                      counter += 1;
                    }
                    if(students.toString() != []){
                      validate  = false;
                    }
                    if(validate == false){
                       final snackBar = SnackBar(content: Text("Success"));
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                       print("sucess");
                       //increase counter
                       FirebaseDatabase.instance.ref().child("counter").set(
                           {
                             'count' : counter + 1
                           });
                       for(int i =0; i<students.length; i++){
                         //Add to Student's content tracker
                         FirebaseDatabase.instance.ref().child("Student/"+students[i]+"/ContentTracking").set({
                           selectedDate.month.toString() + '-' + selectedDate.day.toString() + '-' + selectedDate.year.toString():contentracker[i].text
                         }).catchError((e){
                           print(e);
                         });
                       }
                       //if On Web, go to drawer
                       if(kIsWeb){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => drawer(title: 'HomePage')),
                         );
                       }
                      };
                  }).catchError((e){
                    print(e);
                  });
                },
              ),
            )


          ],
        ),
      ),
    );
  }
  }

