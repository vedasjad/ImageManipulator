import 'package:flutter/material.dart';
import 'package:image_manipulator/features/home/services/home_services.dart';
import 'package:image_manipulator/models/anchor.dart';
import 'package:image_manipulator/models/image_data.dart';
import 'package:image_manipulator/models/images.dart';
import 'package:image_manipulator/models/size.dart';

class HomeProvider extends ChangeNotifier {
  Images _images = Images(
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

  final HomeServices _homeServices = HomeServices();

  void getImages() async {
    _images = await _homeServices.getImages();
    notifyListeners();
  }

  get images => _images;
}
