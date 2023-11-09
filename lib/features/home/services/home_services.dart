import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:image_manipulator/models/anchor.dart';
import 'package:image_manipulator/models/image_data.dart';
import 'package:image_manipulator/models/images.dart';
import 'package:image_manipulator/models/size.dart';

class HomeServices {
  Future<Images> getImages() async {
    const String url = "https://ajanitech.com/temp/flutter-test/app.json";
    Images images = Images(
      background: ImageData(
        url: "",
        size: Size(width: 0, height: 0),
        anchor: Anchor(x: 0, y: 0),
      ),
      shape: ImageData(
        url: "",
        size: Size(width: 0, height: 0),
        anchor: Anchor(x: 0, y: 0),
      ),
      overlay: ImageData(
        url: "",
        size: Size(width: 0, height: 0),
        anchor: Anchor(x: 0, y: 0),
      ),
    );
    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      images = Images.fromJson(res.body);
    } catch (e) {
      debugPrint(e.toString());
    }
    return images;
  }
}
