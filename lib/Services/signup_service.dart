import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:language_translate/Services/models/user_data.dart';

class SignupService {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  String profile = "";
  late String name;
  late String email;
  late String password;
  late final XFile? image;

  Future pickImage() async {
    image = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 45));

    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profile/${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask = ref.putFile(File(image!.path));

    uploadTask.whenComplete(() async {
      profile = await ref.getDownloadURL();
      log(profile);
    }).catchError((onError) {
      log(onError);
    });
    return profile;
  }

  var userData;
  createAccount() async {
    if (name == "" || email == "" || password == "") {
      log('filled the field');
    } else {
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        userData = {
          "uID": user.user!.uid,
          "Name": name,
          "Profile": profile,
          "Email": email,
          "Password": password
        };
    UserData userModel= UserData.fromJson(userData);
        await firebase.collection("users").doc(user.user!.uid).set(userData);
        log(user.toString());
        log("log in successfullt");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          log('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          log('The account already exists for that email.');
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
