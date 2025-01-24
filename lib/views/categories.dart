import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/key.dart';
import '../model/wallpapermodel.dart';
import '../widgets/brand.dart';
import '../widgets/wallpapers_list.dart';

class Categorie extends StatefulWidget {
  final String categoryName;
  const Categorie({super.key, required this.categoryName});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapers = [];
  getSearchWallpapers(String query) async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=100'),
        headers: {
          "Authorization": apiKey,
        });
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel;
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getSearchWallpapers(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: brand(),
        elevation: 4,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              wallpaperList(wallpapers, context),
            ],
          ),
        ),
      ),
    );
  }
}
