// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:language_translate/widgets/textfield.dart';

class ImagePickerWidget extends StatefulWidget {
  
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
    TextEditingController emailCNTR = TextEditingController();
     TextEditingController passwordCNTR = TextEditingController();

   var profile = "";
  //  final _signupService = locator<SignupService>();
FirebaseFirestore firestore = FirebaseFirestore.instance;
  late  XFile? image;
  Future pickImage() async {
    image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 45);
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profile/${DateTime.now().microsecondsSinceEpoch}");
       
    UploadTask uploadTask = ref.putFile(File(image!.path));
    // uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
    //   double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
    //     progressshow = progress;
    // });
    uploadTask.whenComplete(() async {
      String url = await ref.getDownloadURL();  
       setState(() {
          profile=url;
        });
    
      log(profile);
      //
      // widget.UserData["profile"] = url;
    }).catchError((onError) {
      log(onError);
      // snackBar(context, onError.toString());
    });
    return profile;
  }
  postNow ()async{
     FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection("users").doc().set({
        "profile": profile,
        "email":emailCNTR.text,
        "password":passwordCNTR.text

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child:profile == ""
                          ? const CircleAvatar(
                              radius: 65,
                              backgroundImage:AssetImage('assets/images/food-image.jpeg'),
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.transparent,
                            )
                          : CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(profile),
                              backgroundColor: Colors.black,
                              // foregroundColor: Colors.green,
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
                            onTap:(){pickImage();} ,
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
                const SizedBox(height: 30),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: emailCNTR,
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  hintText: 'password',
                  controller: passwordCNTR,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: 120,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "Back",
                            style: GoogleFonts.ibmPlexSans(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                      postNow();
                      },
                      child: Container(
                        height: 60,
                        width: 120,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "postNow",
                            style: GoogleFonts.ibmPlexSans(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
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
      ),
    );
  }
}