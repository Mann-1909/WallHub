import 'package:flutter/material.dart';
import 'package:wallhub/model/wallpapermodel.dart';
import 'package:wallhub/views/image_view.dart';

Widget wallpaperList(List<WallpaperModel> wallpapers, context) {
  return GridView.count(
    physics: ClampingScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 2,
    childAspectRatio: 0.6,
    padding: EdgeInsets.symmetric(horizontal: 16),
    mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
    children: wallpapers.map((wallpaper) {
      return GridTile(
          child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ImageView(
                        imageUrl: wallpaper.src.portrait,
                      )));
        },
        child: Hero(
          tag: wallpaper.src.portrait,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                wallpaper.src.portrait,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                },
              )),
        ),
      ));
    }).toList(),
  );
}
