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
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // context.go("/postnow");
                context.goNamed(RouteNames.postNowData);
              },
              child: Container(
                height: 60,
                width: 300,
                color: Colors.black,
                child: const Center(
                    child: Text(
                  "post know screen",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // context.go("/postnow");
                context.goNamed(RouteNames.profileUpdate);
              },
              child: Container(
                height: 60,
                width: 300,
                color: Colors.black,
                child: const Center(
                    child: Text(
                  "profile update screen",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
