import 'package:flutter/material.dart';
import 'package:image_manipulator/features/home/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeProvider>().getImages();
    super.initState();
  }

  double horizontalSliderValue = 0.5;
  double verticalSliderValue = 0.5;
  double overlaySizeSliderValue = 0.5;
  double shapeSizeSliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    final Images images = context.watch<HomeProvider>().images;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final backgroundHeight = screenWidth * 0.95;
    final shapeHeight = backgroundHeight * 0.6 * shapeSizeSliderValue * 2;
    final shapeWidth = backgroundHeight * 0.8;
    final overlaySize = backgroundHeight * 0.1 * overlaySizeSliderValue * 2;
    final shapeTopPosition = backgroundHeight * 0.3 * verticalSliderValue * 2;
    final shapeLeftPosition =
        backgroundHeight * 0.1 * horizontalSliderValue * 2;
    final overlayLeftPosition =
        shapeLeftPosition + shapeWidth / 2 - overlaySize / 2;
    final overlayTopPosition = shapeTopPosition + shapeHeight * 0.041;
    return SizedBox(
      height: screenHeight,
      child: Column(
        children: [
          SizedBox(
            height: backgroundHeight,
            width: backgroundHeight,
            child: Stack(
              children: [
                Image.network(
                  images.background.url,
                  fit: BoxFit.fitHeight,
                  height: backgroundHeight,
                  width: backgroundHeight,
                ),
                Positioned(
                  left: shapeLeftPosition,
                  top: shapeTopPosition,
                  child: Image.network(
                    images.shape.url,
                    height: shapeHeight,
                    width: shapeWidth,
                  ),
                ),
                Positioned(
                  left: overlayLeftPosition,
                  top: overlayTopPosition,
                  child: Image.network(
                    images.overlay.url,
                    height: overlaySize,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Move Horizontally",
                    ),
                  ],
                ),
              ),
              Slider(
                value: horizontalSliderValue,
                onChanged: (value) {
                  setState(() {
                    horizontalSliderValue = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Move Vertically",
                    ),
                  ],
                ),
              ),
              Slider(
                value: verticalSliderValue,
                onChanged: (value) {
                  setState(() {
                    verticalSliderValue = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Resize Overlay",
                    ),
                  ],
                ),
              ),
              Slider(
                value: overlaySizeSliderValue,
                onChanged: (value) {
                  setState(() {
                    overlaySizeSliderValue = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Resize Shape",
                    ),
                  ],
                ),
              ),
              Slider(
                value: shapeSizeSliderValue,
                onChanged: (value) {
                  setState(() {
                    shapeSizeSliderValue = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
