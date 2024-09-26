import 'package:daily_planner/screen/calender/carlender_screen.dart';
import 'package:daily_planner/screen/home/home_screen.dart';
import 'package:daily_planner/screen/setting/setting_screen.dart';
import 'package:daily_planner/screen/task/task_screen.dart';
import 'package:flutter/material.dart';

class MainScreenPlanner extends StatefulWidget {
  const MainScreenPlanner({super.key});

  @override
  State<MainScreenPlanner> createState() => _MainScreenPlannerState();
}

class _MainScreenPlannerState extends State<MainScreenPlanner> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    HomeScreen(),
    TaskScreen(),
    CarlenderScreen(),
    SettingScreen(),
  ];

  void _onTappedNavigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text('Home'),
      //   actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      // ),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Task',
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calender',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blueGrey,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onTappedNavigate,
      ),
    );
  }
}
