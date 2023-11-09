import 'package:flutter/material.dart';
import 'package:image_manipulator/features/home/services/home_services.dart';
import 'package:image_manipulator/models/images.dart';

class HomeProvider extends ChangeNotifier {
  late Images _images;

  final HomeServices _homeServices = HomeServices();

  void getImages() async {
    _images = await _homeServices.getImages();
  }

  get images => _images;
}
