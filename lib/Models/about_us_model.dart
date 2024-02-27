class AboutUsModel {
  final List<AboutUsDatum> data;

  AboutUsModel({
    required this.data,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        data: List<AboutUsDatum>.from(
            json["data"].map((x) => AboutUsDatum.fromJson(x))),
      );
}

class AboutUsDatum {
  final int id;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  AboutUsDatum({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AboutUsDatum.fromJson(Map<String, dynamic> json) => AboutUsDatum(
        id: json["id"] ?? 0,
        description: json["description"] ?? '',
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
      );
}
