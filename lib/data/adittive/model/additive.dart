class Additive {
  final String id;
  final String name;
  final String category;
  final String danger;
  final String knownAs;
  final String origin;
  final String synonym;

  Additive(
      {this.id,
      this.name,
      this.category,
      this.danger,
      this.knownAs,
      this.origin,
      this.synonym});

  factory Additive.fromJson(Map<String, dynamic> json) {
    return Additive(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        danger: json['danger'],
        knownAs: json['knownAs'],
        origin: json['origin'],
        synonym: json['synonym']);
  }
}
