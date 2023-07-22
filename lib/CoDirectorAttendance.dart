

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
//todo
//
//add hours to tutor profile//done
//add content tracker to student profile//done
//delete hour request after approved//done
//add co-director verification
//add filter so only shows request for dates
class attends extends StatefulWidget {
  attends({Key? key, required this.title}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and flutter create --platforms web .
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _attendsState createState() => _attendsState();
}

class _attendsState extends State<attends> {
  int counter = 1;
  String type = "";
  List<String> newnames = [];
  List<String> tutors =[];
  int hours = 0;
  List<String> displayedtutors = [];
  final ref = FirebaseDatabase.instance.ref();
  TextEditingController denial = TextEditingController();
  var uid = FirebaseAuth.instance.currentUser?.uid;
  List tutors2 = [];
  List names = [];
  Widget addtutor = Container(
    child: Text(''),
  );
  List<String> addedtutors = [];
  String errortext2 = "";
  final List<String> items = [];
  void initState() {
    FirebaseDatabase.instance.reference().child("users/" +FirebaseAuth.instance.currentUser!.uid+"/").get().then((value){
     print(value.value.toString());
      var temp = value.value as Map<String, dynamic>;
     name = temp['Name'];
    });
    FirebaseDatabase.instance.reference().child("Student").once().then((
        result) {
      List<String> codelistfromfb = [];
      var temp = result.snapshot.value as Map<String, dynamic>;



      temp.forEach((key,value) {


        codelistfromfb.add(key.toString());
      });

      names = codelistfromfb;
      newnames = (names as List<String>?)!;
     ;


      // refresh the UI - ListView based on the new data
      setState(() {

      });
    }).catchError((e) {


    });

    FirebaseDatabase.instance.reference().child("tutors").once().then((
        result) {
      List<String> codelistfromfb = [];
      var temp = result.snapshot.value as Map<String, dynamic>;
      print(temp.toString());




      temp.forEach((key,value) {
        print(key.toString());


        codelistfromfb.add(key.toString());
      });

      tutors2 = codelistfromfb;
      print(tutors2.toString() + "2");
      tutors = (tutors2 as List<String>?)!;
      print(tutors.toString()+"1");
      ;


      // refresh the UI - ListView based on the new data
      setState(() {

      });
    }).catchError((e) {


    });
    int number = 0;
    Future.delayed(const Duration(milliseconds: 1000), () {
      String wordPair = "";
      while (number < newnames.length) {

        items.add(newnames[number].toString());
        number++;

        setState(() {

        });




      };
      items.sort();

// Here you can write your code


    });
    // TODO: implement initState

    super.initState();
    //var uid = Signup.FirebaseAuth.instance.createUserWithEmailAndPassword.value.user!.uid;

    
    FirebaseDatabase.instance.reference().child('users/'+uid.toString()).once().then((value)
    {
     // type = value.value['type'];


    }
    );

    FirebaseDatabase.instance.reference()
        .child("counter" )
        .once()
        .then((res) {
          var temp = res.snapshot.value as Map<String, dynamic>;
         counter = temp['count'];



    }).catchError((e) {

    }
    );

  }
  List codeList = [

  ];

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
  double _currentSliderValue = 2;

  @override
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
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment:CrossAxisAlignment.center,
          children: <Widget>[
            Text("Select the student(s) you taught, enter their content trackers, and select the date, then click save.", style: TextStyle(fontWeight: FontWeight.bold)),

            Container(
                margin: EdgeInsets.only(top: 100),
                child: DropdownSearch<String>.multiSelection(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          errorText: errortext,
                          hintText: 'Select Student Names'

                      )
                  ),


                  items: items,
                  popupProps: PopupPropsMultiSelection<String>.menu(
                    showSelectedItems: true,

                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),

                  onChanged:(List<String> test){
                    setState(() {
                      print(test);
                      students = test;
                      print(students);
                      print(students.length);

                    });
                  },
                  selectedItems: students,
                )
            ),
            Container(
                margin: EdgeInsets.only(top: 100),
                child: DropdownSearch<String>.multiSelection(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          errorText: errortext,
                          hintText: 'Additional Tutors'

                      )
                  ),


                  items: tutors,
                  popupProps: PopupPropsMultiSelection<String>.menu(
                    showSelectedItems: true,

                    disabledItemFn: (String s) => s.startsWith(name),
                  ),

                  onChanged:(List<String> test){
                    setState(() {
                      print(test);
                      addedtutors = test;
                      addedtutors.add(name);
                      print(students);
                      print(students.length);

                    });
                  },
                  selectedItems: displayedtutors,
                )
            ),
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
            Container(width:400, height:50,margin: EdgeInsets.all(10),child: TextButton(onPressed: ()=> _selectDate(context), child: Text(textdate.toString()))),
            Container(
              width: 400,
              height: 50,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Save"),
                onPressed: (){
                  FirebaseDatabase.instance.ref().child("AttendanceLog/" +  counter.toString()+"/Info").set({
                    "Name": name,
                    "Hours" : HoursController.text,
                    "Date" : selectedDate.year.toString()+ '-' + selectedDate.month.toString() + "-" + selectedDate.day.toString(),

                  }).then((value) {

                    for(int i = 0; i < addedtutors.length; i++){
                      FirebaseDatabase.instance.ref().child("AttendanceLog/"+counter.toString()+'/Info').set({
                        'Date' :selectedDate.year.toString()+ '-' + selectedDate.month.toString() + "-" + selectedDate.day.toString(),
                        'Hours' : '2',
                        'Name' : addedtutors[i],

                      });
                      counter += 1;
                    }

                      bool validate = false;

                      if(validate == false){
                       final snackBar = SnackBar(content: Text("Success")


                      );
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                       print("sucess");
                       FirebaseDatabase.instance.reference().child("counter").set(
                           {
                             'count' : counter + 1

                           });
                       for(int i =0; i<students.length; i++){
                         FirebaseDatabase.instance.ref().child("Student/"+students[i]+"/ContentTracking").set({
                          selectedDate.month.toString() + '-' + selectedDate.day.toString() + '-' + selectedDate.year.toString():contentracker[i].text

                         }).catchError((e){
                           print(e);
                         });
                       }

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
            ),
            Container(
              child: ElevatedButton(
                child: Text("verify Hours"),
                onPressed: (){

                    FirebaseDatabase.instance.reference().child("AttendanceLog/" ).once().then((result){
                      var codelistfromfb = [];
                      var datecodelist = [];
                      print('Secusese');
                    var temp = result.snapshot.value as Map<String,dynamic>;

                      temp.forEach(( key, value) {

                        delete.add(int.parse(key));



                        codelistfromfb.add(value['Info']['Name']);
                        datecodelist.add(value['Info']['Date']);
                      });
                      codeList = codelistfromfb;
                      codeDate = datecodelist;

                        // refresh the UI - ListView based on the new data
                      setState(() {

                      });

                    }).catchError((e) {
                      print('failed');
                      print(e);
                    });
                },
              ),
            ),
            Container(
              height: (codeList.length*50)+10,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: codeList.length,
                  itemBuilder: (BuildContext context, int index) {

                    return Container(




                      height: 50,
                      margin: EdgeInsets.only(top:5),

                      //color: Colors.blue[700],
                      child:  Center(child: Row(
                        children: [

                          Text('Hours: '),

                          Text('2'+ " "),
                          Text('Date: '),
                          Container(

                              child: Text(codeDate[index].toString())),
                          Text(' Name: '),
                          Container(child: Text(codeList[index].toString())),
                          Container(
                              margin: EdgeInsets.only(right:50),
                              child: ElevatedButton(onPressed: (){
                            FirebaseDatabase.instance.reference().child('tutors/'+codeList[index].toString()).once().then((value)
                            {
                              print(codeList[index].toString() );

                              var temp = value.snapshot.value as Map<String,dynamic>;

                              hours = temp['Hours'];
                              hours = hours+2;
                              print(hours);
                            }
                            );
                            Future.delayed(const Duration(milliseconds: 250),(){
                              FirebaseDatabase.instance.reference().child("tutors/"+ codeList[index].toString() ).update(
                                  {


                                    'Hours'  : hours,


                                  }
                              ).then((value) {
                                print(hours.toString() + "hours");
                                print(codeList[index].toString()+"final");
                              });
                              FirebaseDatabase.instance.reference().child("tutors/"+ codeList[index].toString() + '/logs' ).update(
                                  {


                                    codeDate[index].toString()  : 2,


                                  }
                              ).then((value) {
                                print(hours.toString() + "hours");
                                print(codeDate.toString());
                                print(codeList[index].toString()+"final");
                              });

                            });



                            Future.delayed(const Duration(milliseconds: 400),(){
                              FirebaseDatabase.instance.reference().child('AttendanceLog/' + delete[index].toString()).remove().then((value){
                                delete.remove(delete[index]);

                                codeList.remove(codeList[index]);
                                codeDate.remove(codeList[index]);

                                setState(() {

                                });
                              });
                            });




                          }, child: Text("Verify Hours"))),
                          Container(
                            child: ElevatedButton(
                              child: Text("Deny Hours"),
                              onPressed: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: Text('Are you sure you want to delete this request?'),
                                      content: Column(
                                        children: [
                                          Text("Enter Reason for Denying(Duplicate, Did not tutor, Wrong Date, etc.):"),
                                          TextField(
                                            controller: denial,
                                            decoration: InputDecoration(
                                              errorText: errortext2,
                                            ),

                                          )
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: (){
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: Text('Cancel')),
                                        TextButton(
                                            onPressed: (){
                                              if(denial.text != ""){
                                                FirebaseDatabase.instance.ref().child('AttendanceLog/' + delete[index].toString()).remove().catchError((e){
                                                  print(e);
                                                });
                                                print(delete[index].toString());
                                                setState(() {

                                                });

                                                Navigator.pop(context, 'Confirm');
                                                FirebaseDatabase.instance.ref().child('tutors/' + codeList[index] + '/denied').set({
                                                  'reason' : denial.text,
                                                  'date' : codeDate[index].toString(),
                                                });
                                                codeList.remove(codeList[index]);
                                                codeDate.remove(codeList[index]);
                                                setState(() {

                                                });


                                              }else{
                                                errortext2 = 'Can not be empty';

                                              }
                                            },
                                            child: Text('Confirm')),

                                      ],
                                    )
                                );
                              },
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              child: Text('Mark as late'),
                              onPressed: (){
                                FirebaseDatabase.instance.reference().child('tutors/'+codeList[index].toString()).once().then((value)
                                {
                                  print(codeList[index].toString() );

                                  var temp = value.snapshot.value as Map<String,dynamic>;

                                  hours = temp['Hours'];
                                  hours = hours+1 ;
                                  print(hours);
                                }
                                );
                                Future.delayed(const Duration(milliseconds: 250),(){
                                  FirebaseDatabase.instance.reference().child("tutors/"+ codeList[index].toString() ).update(
                                      {


                                        'Hours'  : hours,


                                      }
                                  ).then((value) {
                                    print(hours.toString() + "hours");
                                    print(codeList[index].toString()+"final");
                                  });
                                  FirebaseDatabase.instance.reference().child("tutors/"+ codeList[index].toString() + '/logs' ).update(
                                      {


                                        codeDate[index].toString()  : 1,


                                      }
                                  ).then((value) {
                                    print(hours.toString() + "hours");
                                    print(codeDate.toString());
                                    print(codeList[index].toString()+"final");
                                  });

                                });



                                Future.delayed(const Duration(milliseconds: 400),(){
                                  FirebaseDatabase.instance.reference().child('AttendanceLog/' + delete[index].toString()).remove().then((value){
                                    delete.remove(delete[index]);

                                    codeList.remove(codeList[index]);
                                    codeDate.remove(codeList[index]);

                                    setState(() {

                                    });
                                  });
                                });
                              },
                            ),
                          )

                        ],
                      )),
                    );
                  }


              ),),



          ],
        ),

      ),
    );
  }
  }

