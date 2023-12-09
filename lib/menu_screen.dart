import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:language_translate/routes/main_raoute.dart';

class MenuScreen extends StatefulWidget {
  final String name;
  const MenuScreen({super.key, required this.name});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${widget.name}"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 60,
            width: 300,
            color: Colors.black,
            child: GestureDetector(
                onTap: () {
                  // context.go("/postnow");
                  context.goNamed(RouteNames.postNowData);
                },
                child: const Center(
                    child: Text(
                  "home button",
                  style: TextStyle(color: Colors.white),
                ))),
          ),
        ),
      ),
    );
  }
}
