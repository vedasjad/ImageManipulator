import 'dart:convert';

class Anchor {
  final int x;
  final int y;
  Anchor({
    required this.x,
    required this.y,
  });

  Anchor copyWith({
    int? x,
    int? y,
  }) {
    return Anchor(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'x': x});
    result.addAll({'y': y});
  
    return result;
  }

  factory Anchor.fromMap(Map<String, dynamic> map) {
    return Anchor(
      x: map['x']?.toInt() ?? 0,
      y: map['y']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Anchor.fromJson(String source) => Anchor.fromMap(json.decode(source));

  @override
  String toString() => 'Anchor(x: $x, y: $y)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Anchor &&
      other.x == x &&
      other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
