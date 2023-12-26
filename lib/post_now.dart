import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'img_picker.dart';

class PostNowData extends StatefulWidget {
  const PostNowData({super.key});

  @override
  State<PostNowData> createState() => _PostNowDataState();
}

class _PostNowDataState extends State<PostNowData> {
  var 
  Stream collectionStream =
      FirebaseFirestore.instance.collection('users').doc(user!.uid).snapshots();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: _usersStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      }
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            //          Map<String, dynamic> data =
                            // document.data()! as Map<String, dynamic>;
                            var data = snapshot.data!.docs[index];
                            return ListTile(
                              horizontalTitleGap: 7,
                              contentPadding: const EdgeInsets.all(0),
                              minVerticalPadding: 0,
                              title: Text(data['email'].toString()),
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(data['profile'].toString()),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.transparent,
                              ),
                              subtitle: Text(data['password'].toString()),
                              trailing: PopupMenu(
                                id: data.id.toString(),
                                data: data,
                              ),
                            );
                          });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum SampleItem { itemOne, itemTwo }

class PopupMenu extends StatefulWidget {
  final String id;
  final data;

  const PopupMenu({super.key, required this.id, required this.data});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  SampleItem? selectedMenu;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> deleteUser() {
    return users
        .doc(widget.id)
        .delete()
        .then((value) => log("User Deleted"))
        .catchError((error) => log("Failed to delete user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      // padding: const EdgeInsets.all(0),
      iconSize: 15, position: PopupMenuPosition.over,
      initialValue: selectedMenu,

      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {
        log(item.toString());
        if (item == SampleItem.itemOne) {
          deleteUser();
          log("delete");
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ImagePickerWidget(
                        id: widget.id,
                        data: widget.data,
                      ))));
          log("Edit");
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
            value: SampleItem.itemOne,
            child: Text(
              "Delete",
              style: GoogleFonts.ibmPlexSans(color: Colors.red),
            )),
        PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            // padding: EdgeInsets.all(0),
            child: Text(
              "Edit",
              style: GoogleFonts.ibmPlexSans(color: Colors.black),
            ))
      ],
    );
  }
}
