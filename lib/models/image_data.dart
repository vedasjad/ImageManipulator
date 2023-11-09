import 'dart:convert';

import 'anchor.dart';
import 'size.dart';

class ImageData {
  final String url;
  final Size? size;
  final Anchor? anchor;
  ImageData({
    required this.url,
    required this.size,
    required this.anchor,
  });

  ImageData copyWith({
    String? url,
    Size? size,
    Anchor? anchor,
  }) {
    return ImageData(
      url: url ?? this.url,
      size: size ?? this.size,
      anchor: anchor ?? this.anchor,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'url': url});
    if(size != null){
      result.addAll({'size': size!.toMap()});
    }
    if(anchor != null){
      result.addAll({'anchor': anchor!.toMap()});
    }
  
    return result;
  }

  factory ImageData.fromMap(Map<String, dynamic> map) {
    return ImageData(
      url: map['url'] ?? '',
      size: map['size'] != null ? Size.fromMap(map['size']) : null,
      anchor: map['anchor'] != null ? Anchor.fromMap(map['anchor']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageData.fromJson(String source) => ImageData.fromMap(json.decode(source));

  @override
  String toString() => 'ImageData(url: $url, size: $size, anchor: $anchor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ImageData &&
      other.url == url &&
      other.size == size &&
      other.anchor == anchor;
  }

  @override
  int get hashCode => url.hashCode ^ size.hashCode ^ anchor.hashCode;
}
