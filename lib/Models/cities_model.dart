class CitiesModel {
    final List<CitiesDatum> data;

    CitiesModel({
        required this.data,
    });

    factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
        data: List<CitiesDatum>.from(json["data"].map((x) => CitiesDatum.fromJson(x))),
    );
}

class CitiesDatum {
    final int id;
    final String name;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;

    CitiesDatum({
        required this.id,
        required this.name,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory CitiesDatum.fromJson(Map<String, dynamic> json) => CitiesDatum(
        id: json["id"]??0,
        name: json["name"]??'',
        image: json["image"]??'',
        createdAt: DateTime.parse(json["created_at"]?? DateTime.now().toString()),
        updatedAt: DateTime.parse(json["updated_at"]?? DateTime.now().toString()),
    );

}
