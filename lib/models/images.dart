import 'dart:convert';

import 'image_data.dart';

class Images {
  final ImageData background;
  final ImageData shape;
  final ImageData overlay;
  Images({
    required this.background,
    required this.shape,
    required this.overlay,
  });

  Images copyWith({
    ImageData? background,
    ImageData? shape,
    ImageData? overlay,
  }) {
    return Images(
      background: background ?? this.background,
      shape: shape ?? this.shape,
      overlay: overlay ?? this.overlay,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'background': background.toMap()});
    result.addAll({'shape': shape.toMap()});
    result.addAll({'overlay': overlay.toMap()});

    return result;
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      background: ImageData.fromMap(map['background']),
      shape: ImageData.fromMap(map['shape']),
      overlay: ImageData.fromMap(map['overlay']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) => Images.fromMap(json.decode(source));

  @override
  String toString() =>
      'Images(background: $background, shape: $shape, overlay: $overlay)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Images &&
        other.background == background &&
        other.shape == shape &&
        other.overlay == overlay;
  }

  @override
  int get hashCode => background.hashCode ^ shape.hashCode ^ overlay.hashCode;
}
