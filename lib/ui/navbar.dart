import 'package:flutter/material.dart';
import 'package:refactory_test/ui/add_todo_page.dart';

import '../constant.dart';
import 'homepage/home_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  final screen =  [
    const HomePage(),
    AddTodoPage(),
    const Center(
      child: Text('data'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40.0,
        backgroundColor: Colors.white,
        selectedFontSize: 20,
        unselectedFontSize: 17,
        selectedItemColor: baseColor,
        unselectedItemColor: Colors.black26,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        elevation: 12,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/Icon.png',
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
              label: 'Task'),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/Group 7 (4).png',
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
    );
  }

  
}
