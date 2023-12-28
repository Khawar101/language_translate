import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Update')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
                Stack(
                  children: [
                    Center(
                      child: profile == null
                          ? const CircleAvatar(
                              radius: 65,
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.transparent,
                            )
                          : CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(profile.toString()),
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.transparent,
                            ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                uploadProfile();
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(Icons.edit_outlined,
                                  color: Color(0xffffffff), size: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}