import 'package:flutter/material.dart';

class PostNowData extends StatefulWidget {
  const PostNowData({super.key});

  @override
  State<PostNowData> createState() => _PostNowDataState();
}

class _PostNowDataState extends State<PostNowData> {
  final items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
  ];
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
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                       horizontalTitleGap:7,
                       
                      contentPadding: const EdgeInsets.all(0),
                      minVerticalPadding: 0,
                      title: Text(items[index]),
                      leading: 
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/images/food-image.jpeg'),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.transparent,
                      ),
                      subtitle: const Text("email or password"),
                      trailing: const Icon(Icons.edit),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
