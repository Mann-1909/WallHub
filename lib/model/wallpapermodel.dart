class WallpaperModel {
  String photographer;
  String photographerUrl; // Corrected field name
  int photographerId; // Corrected field name
  SRCModel src;

  WallpaperModel({
    required this.src,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      src: SRCModel.fromMap(jsonData["src"]),
      photographer: jsonData["photographer"],
      photographerUrl: jsonData["photographer_url"], // Correct key
      photographerId: jsonData["photographer_id"], // Correct key
    );
  }
}

class SRCModel {
  String original;
  String small;
  String portrait; // Corrected field name

  SRCModel({
    required this.original,
    required this.small,
    required this.portrait,
  });

  factory SRCModel.fromMap(Map<String, dynamic> jsonData) {
    return SRCModel(
      original: jsonData["original"],
      small: jsonData["small"],
      portrait: jsonData["portrait"], // Correct key
    );
  }
}
