// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:language_translate/img_picker.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:language_translate/post_now.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> views = [
    const PostNowData(),
    Container(),
    Container(),
      ImagePickerWidget(data: '', id: '',),
    Container(),
  ];

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.indicator;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = const Color(0xFF4873A6).withOpacity(0.7);
  Color unselectedColor = Colors.blueGrey;

  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
    const Color(0xFFF4E4CE),
  ];
  ItemPosition(value) {
    setState(() {
      selectedItemPosition = value;
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Random',
      style: optionStyle,
    ),
    Text(
      'Index 1: Upload',
      style: optionStyle,
    ),
    Text(
      'Index 2: Quotes',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf4e0d9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Icon(Icons.info_outline),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: views[selectedItemPosition],
      
      bottomNavigationBar: SnakeNavigationBar.color(
        shadowColor: const Color(0xFF4873A6).withOpacity(0.7),
        height: 40,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: unselectedColor,

        ///configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: selectedItemPosition,
        onTap: (index) => ItemPosition(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Activity'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_lesson_outlined, size: 20),
              label: 'Lessons'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera, size: 20), label: 'Camera'),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_2_outlined, size: 30), label: 'Textfield'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Person')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
