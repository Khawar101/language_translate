import 'package:flutter/material.dart';

class PdfPicker extends StatefulWidget {
  const PdfPicker({super.key});

  @override
  State<PdfPicker> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PdfPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Icon(
          Icons.attach_file_outlined,
          size: 35,
        ),
      ),
    );
  }
}
