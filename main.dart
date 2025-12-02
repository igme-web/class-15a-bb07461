import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImagePickerDemo(),
    );
  }
}

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {

  File? _image;
  final ImagePicker _picker = ImagePicker();
  
  Future<void> _takePhoto() async {
  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

  if (photo != null) {
    setState(() {
      _image = File(photo.path);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No image selected'),
            ElevatedButton(
              onPressed: _takePhoto,
              child: const Text('Take Photo'),
            ),
             if (_image != null)
                Image.file(_image!, height: 300)
            else
               const Text('No image selected'),
            
            
          ],
        ),
      ),
    );
  }
}

