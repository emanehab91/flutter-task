import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ImageFullScreen extends StatelessWidget {
  final String imageUrl;

  ImageFullScreen({required this.imageUrl});

  Future<void> _downloadImage(BuildContext context) async {
    try {
      var dio = Dio();

      var dir = await getApplicationDocumentsDirectory();
      String filePath = '${dir.path}/downloaded_image.jpg';

      await dio.download(imageUrl, filePath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image downloaded to $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Image Full Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.tealAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () => _downloadImage(context), // استدعاء دالة التحميل عند الضغط على الزر
          ),
        ],
      ),
      body: Center(
        child: InstaImageViewer(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}