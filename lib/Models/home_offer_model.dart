class OffersModel {
    final List<OfferDatum> data;

    OffersModel({
        required this.data,
    });

    factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        data: List<OfferDatum>.from((json["data"]??[]).map((x) => OfferDatum.fromJson(x))),
    );
}

class OfferDatum {
    final int id;
    final String desc;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;

    OfferDatum({
        required this.id,
        required this.desc,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory OfferDatum.fromJson(Map<String, dynamic> json) => OfferDatum(
        id: json["id"]??0,
        desc: json["desc"]??'',
        image: json["image"]??'',
        createdAt: DateTime.tryParse(json["created_at"])??DateTime.now(),
        updatedAt: DateTime.tryParse(json["updated_at"])??DateTime.now(),
    );

}
