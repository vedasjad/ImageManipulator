import 'dart:convert';

class Size {
  final int width;
  final int height;
  Size({
    required this.width,
    required this.height,
  });

  Size copyWith({
    int? width,
    int? height,
  }) {
    return Size(
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'width': width});
    result.addAll({'height': height});
  
    return result;
  }

  factory Size.fromMap(Map<String, dynamic> map) {
    return Size(
      width: map['width']?.toInt() ?? 0,
      height: map['height']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Size.fromJson(String source) => Size.fromMap(json.decode(source));

  @override
  String toString() => 'Size(width: $width, height: $height)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Size &&
      other.width == width &&
      other.height == height;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode;
}
