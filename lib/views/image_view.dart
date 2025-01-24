import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imageUrl;

  const ImageView({super.key, required this.imageUrl});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  String imageUrl = '';

  @override
  void initState() {
    imageUrl = widget.imageUrl;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: imageUrl,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    _save();
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 80,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(colors: [
                              Color(0x36FFFFFF),
                              Color(0x0FFFFFFF)
                            ])),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 80,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(colors: [
                              Color(0x36FFFFFF),
                              Color(0x0FFFFFFF)
                            ])),
                        child: Column(
                          children: [
                            Text(
                              "Save Wallpaper",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "Image will be saved in gallery",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _save() async {
    bool hasPermission = await _askPermission();
    if (!hasPermission) {
      return;
    }

    try {
      var response = await Dio().get(
        widget.imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 100,
          name: "wallhub");
      if (result['isSuccess']) {
        Navigator.pop(context);
      } else {
        print("Failed to save the image");
      }
    } catch (e) {
      print("Error saving image: $e");
    }
  }

  _askPermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else if (await Permission.manageExternalStorage.request().isGranted) {
      return true;
    }
    return false;
  }
}
