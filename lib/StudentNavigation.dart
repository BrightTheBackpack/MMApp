import 'package:flutter/material.dart';
import 'package:katheriniesorwutever/Feedbacks.dart';
import 'package:katheriniesorwutever/StudentHome.dart';
import 'package:katheriniesorwutever/main.dart';
import 'package:katheriniesorwutever/puzzle.dart';
import 'package:katheriniesorwutever/schudule.dart';
import 'HomePage.dart';
import 'schudule.dart';
import 'profile.dart';
import 'Attendance.dart';
import 'package:katheriniesorwutever/FeedbackPage.dart';
class StudentNav extends StatefulWidget {
  StudentNav({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _StudentNavState createState() => _StudentNavState();
}

class _StudentNavState extends State<StudentNav> {
  int _counter = 0;
  var _selectedIndex = 2;
  late List<Widget> _widgetoption;
  @override
  void initState(){

    super.initState();
    _widgetoption = [FeedbackPage(title: 'Confirm'), puzzle(title: 'puzzles'),StudentHome(title: 'Doordash'),profile(title: 'title'),Feedbacks(title: 'title')];
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to
      _counter++;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes d would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framdgets.
    return Scaffold(

      body: Center(
        child: _widgetoption[_selectedIndex],
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today
            ),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Feedback',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      // This trailing comma makes auto-formatting nicer .
    );
  }

  void _onItemTapped(int value) {
    _selectedIndex = value;
    setState(() {

    });
  }
}
