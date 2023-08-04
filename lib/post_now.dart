import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostNowData extends StatefulWidget {
  const PostNowData({super.key});

  @override
  State<PostNowData> createState() => _PostNowDataState();
}

class _PostNowDataState extends State<PostNowData> {
  Stream collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  // final items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  //   'Item 6',
  //   'Item 7',
  //   'Item 8',
  //   'Item 9',
  // ];
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
                            var data=snapshot.data!.docs[index];
                            return ListTile(
                              horizontalTitleGap: 7,
                              contentPadding: const EdgeInsets.all(0),
                              minVerticalPadding: 0,
                              title:
                                  Text(data['email'].toString()),
                              leading:  CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(data['profile'].toString()),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.transparent,
                              ),
                              subtitle:  Text(data['password'].toString()),
                              trailing: const Icon(Icons.edit),
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
