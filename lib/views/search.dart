import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/categorydata.dart';
import '../data/key.dart';
import '../model/wallpapermodel.dart';
import '../widgets/brand.dart';
import 'package:http/http.dart' as http;

import '../widgets/wallpapersList.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.searchQuery});
  final String searchQuery;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List<WallpaperModel> wallpapers = [];
  getSearchWallpapers(String query) async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=100'),
        headers: {
          "Authorization": apiKey,
        });

    print("hello");
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
    getSearchWallpapers(widget.searchQuery);
    searchController.text = widget.searchQuery;
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
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(50)),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onSubmitted: (String value) {
                          getSearchWallpapers(searchController.text);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Search(
                                    searchQuery: searchController.text,
                                  )));
                        },
                        autofocus: false,
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "search", border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          getSearchWallpapers(searchController.text);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Search(
                                    searchQuery: searchController.text,
                                  )));
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 20),
              WallpaperList(wallpapers, context),
            ],
          ),
        ),
      ),
    );
  }
}
