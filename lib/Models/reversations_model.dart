class ReversationsModel {
  final List<ReversationDatum> data;

  ReversationsModel({
    required this.data,
  });

  factory ReversationsModel.fromJson(Map<String, dynamic> json) =>
      ReversationsModel(
        data: List<ReversationDatum>.from(
            (json["data"] ?? []).map((x) => ReversationDatum.fromJson(x))),
      );
}

class ReversationDatum {
  final int id;
  final String userId;
  final String apartmentId;
  final DateTime dateFrom;
  final DateTime dateTo;
  final String totalPrice;
  final String status;
  final String paid;
  final dynamic createdAt;
  final dynamic updatedAt;
  final Apartment apartment;
  final String userName;

  ReversationDatum({
    required this.id,
    required this.userId,
    required this.apartmentId,
    required this.dateFrom,
    required this.dateTo,
    required this.totalPrice,
    required this.status,
    required this.paid,
    required this.createdAt,
    required this.updatedAt,
    required this.apartment,
    required this.userName,
  });

  factory ReversationDatum.fromJson(Map<String, dynamic> json) =>
      ReversationDatum(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? '',
        apartmentId: json["apartment_id"] ?? '',
        dateFrom: DateTime.tryParse(json["date_from"] ?? '') ?? DateTime.now(),
        dateTo: DateTime.tryParse(json["date_to"] ?? '') ?? DateTime.now(),
        totalPrice: json["total_price"] ?? '',
        status: json["status"] ?? '',
        paid: json["paid"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        apartment: Apartment.fromJson(json["apartment"] ?? {}),
        userName: json["user_name"] ?? '',
      );
}

class Apartment {
  final int id;
  final String name;
  final dynamic unitSpace;
  final String price;
  final String bathrooms;
  final String lounges;
  final dynamic diningSession;
  final dynamic features;
  final String view;
  final dynamic additionalFeatures;
  final String areaId;
  final dynamic video;
  final String parking;
  final dynamic maxGuests;
  final String maxRooms;
  final String ownerId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<dynamic> reviews;
  final List<dynamic> rooms;
  final Area area;
  final String tax;
  final int totalPrice;
  final String areaName;
  final double rating;
  final int adults;
  final int beds;
  final List<dynamic> images;

  Apartment({
    required this.id,
    required this.name,
    required this.unitSpace,
    required this.price,
    required this.bathrooms,
    required this.lounges,
    required this.diningSession,
    required this.features,
    required this.view,
    required this.additionalFeatures,
    required this.areaId,
    required this.video,
    required this.parking,
    required this.maxGuests,
    required this.maxRooms,
    required this.ownerId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.reviews,
    required this.rooms,
    required this.area,
    required this.tax,
    required this.totalPrice,
    required this.areaName,
    required this.rating,
    required this.adults,
    required this.beds,
    required this.images,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        unitSpace: json["unit_space"] ?? '',
        price: json["price"] ?? '',
        bathrooms: json["bathrooms"] ?? '',
        lounges: json["lounges"] ?? '',
        diningSession: json["dining_session"] ?? '',
        features: json["features"] ?? '',
        view: json["view"] ?? '',
        additionalFeatures: json["additional_features"] ?? '',
        areaId: json["area_id"] ?? '',
        video: json["video"] ?? '',
        parking: json["parking"] ?? '',
        maxGuests: json["max_guests"] ?? '',
        maxRooms: json["max_rooms"] ?? '',
        ownerId: json["owner_id"] ?? '',
        status: json["status"] ?? '',
        createdAt:
            DateTime.tryParse(json["created_at"] ?? '') ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(json["updated_at"] ?? '') ?? DateTime.now(),
        reviews: List<dynamic>.from((json["reviews"] ?? []).map((x) => x)),
        rooms: List<dynamic>.from((json["rooms"] ?? []).map((x) => x)),
        area: Area.fromJson(json["area"] ?? {}),
        tax: json["tax"] ?? '',
        totalPrice: json["total_price"] ?? 0,
        areaName: json["area_name"] ?? '',
        rating: (json["rating"] ?? 0).toDouble(),
        adults: json["adults"] ?? 0,
        beds: json["beds"] ?? 0,
        images: List<dynamic>.from((json["images"] ?? []).map((x) => x)),
      );
}

class Area {
  final int id;
  final String name;
  final String cityId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Area({
    required this.id,
    required this.name,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        cityId: json["city_id"] ?? '',
        createdAt:
            DateTime.tryParse(json["created_at"] ?? '') ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(json["updated_at"] ?? '') ?? DateTime.now(),
      );
}
