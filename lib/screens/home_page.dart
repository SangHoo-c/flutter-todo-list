import 'package:flutter/material.dart';
import 'package:todo_list/screens/info_screen.dart';
import 'package:todo_list/screens/tasks_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [TasksScreen(), InfoScreen()];

  void _onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: _children,
        physics: NeverScrollableScrollPhysics(), // No sliding
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Color(0xFF6200EE),
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.black38,
        unselectedItemColor: Colors.white.withOpacity(.90),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Colors.grey,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
            // backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
