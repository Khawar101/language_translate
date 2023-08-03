// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_translate/img_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {

  //     _counter++;
  //   });
  // }
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
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.asset(
              'assets/images/food-image.jpeg',
              fit: BoxFit.cover,
            ),
          ),
         Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height:190),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const ImagePicker())));
                },
                child: Container(height: 60,width: 120,
                color: Colors.black,
                child: Center(child: Text("textfield",style: GoogleFonts.ibmPlexSans(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,)),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFf4e0d9),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/rendom.png',
              width: 30,
            ),
            label: 'Random',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 30,
            ),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/quotes.png',
              width: 30,
            ),
            label: 'Quotes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
