import 'package:flutter/material.dart';
import 'package:katheriniesorwutever/profile.dart';

import 'Attendance.dart';
import 'Feedbacks.dart';
import 'HomePage.dart';
import 'hourcounter.dart';





class drawer extends StatefulWidget {
  const drawer({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  int _selectedIndex = 0;
  String title = "Home Page";
  List Tlist = ['Home','Attendance Log', 'Student Progress Tracker','Hour Counter','Profile'];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = [
    HomePage(title: 'Doordash'),
    attend(title: 'Confirm'),
    Feedbacks(title: 'title'),

    hourcounter(title: 'Hour Counter'),
    profile(title: 'title'),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      title = Tlist[_selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
           // const DrawerHeader(
             // decoration: BoxDecoration(
               // color: Colors.blue,

              //),
             // child: Text('Math Matter Tutor Portal'),
            //)
             Text('Math Matter Tutor Portal',style: TextStyle(
               fontSize: 20
             )),
            Container(width:200, height:200,child:Image.network('https://media.discordapp.net/attachments/857090756376526878/857817923963191306/aHR0cHM6Ly9zY29udGVudC1kZnc1LTIuY2RuaW5zdGFncmFtLmNvbS92L3Q1MS4yODg1LTE5LzE0MDIzMTAzM18xMTExMjc1ODA4.jpeg?width=630&height=630')),



            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Attendance Log'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Student Content Tracker'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Hour Counter'),
              selected: _selectedIndex == 3,
              onTap: () {
                // Update the state of the app
                _onItemTapped(3);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              selected: _selectedIndex == 4,
              onTap: () {
                // Update the state of the app
                _onItemTapped(4);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}