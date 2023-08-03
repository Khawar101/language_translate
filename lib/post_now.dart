import 'package:flutter/material.dart';

class PostNowData extends StatefulWidget {
  const PostNowData({super.key});

  @override
  State<PostNowData> createState() => _PostNowDataState();
}

class _PostNowDataState extends State<PostNowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
        child: Column(
          children: [
            
          ],
        ),
        ), 
      ),
    );
  }
}