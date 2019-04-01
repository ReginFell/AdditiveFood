class Additive {
  String id;
  String name;

  Additive({this.id, this.name});

  factory Additive.fromJson(Map<String, dynamic> json) {
    return Additive(id: json['id'], name: json['name']);
  }
}
