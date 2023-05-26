class Asset {
  final String image;
  final List<String> texts;

  const Asset({required this.image, required this.texts});

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      image: json["image"],
      texts: json["texts"].map((text) => text.toString()).toList(),
    );
  }
}
