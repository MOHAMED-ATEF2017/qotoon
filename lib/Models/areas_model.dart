
class AreasModel {
    final List<AreasDatum> data;

    AreasModel({
        required this.data,
    });

    factory AreasModel.fromJson(Map<String, dynamic> json) => AreasModel(
        data: List<AreasDatum>.from((json["data"]??[]).map((x) => AreasDatum.fromJson(x))),
    );

}

class AreasDatum {
    final int id;
    final String name;
    final String city;
    final dynamic boundaries;

    AreasDatum({
        required this.id,
        required this.name,
        required this.city,
        required this.boundaries,
    });

    factory AreasDatum.fromJson(Map<String, dynamic> json) => AreasDatum(
        id: json["id"]??0,
        name: json["name"]??'',
        city: json["city"]??'',
        boundaries: json["boundaries"]??'',
    );
}
