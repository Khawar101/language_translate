import 'package:flutter/material.dart';
import 'package:language_translate/widgets/textfield.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            child: Column(
                  children: [
         
            CustomTextFormField(
              hintText: 'Email',
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              hintText: 'password',
            ),
                  ],
                ),
          )),
    );
  }
}
