class DiscoverQotoonModel {
  final bool isSuccess;
  final List<DiscoverQotoonDatum> data;

  DiscoverQotoonModel({
    required this.isSuccess,
    required this.data,
  });

  factory DiscoverQotoonModel.fromJson(Map<String, dynamic> json) =>
      DiscoverQotoonModel(
        isSuccess: json["isSuccess"] ?? false,
        data: List<DiscoverQotoonDatum>.from(
            (json["data"] ?? []).map((x) => DiscoverQotoonDatum.fromJson(x))),
      );
}

class DiscoverQotoonDatum {
  final int id;
  final String name;
  final String unitSpace;
  final String price;
  final String bathrooms;
  final String lounges;
  final String diningSession;
  final List<String> features;
  final String view;
  final List<String> additionalFeatures;
  final String areaId;
  final dynamic video;
  final String parking;
  final String maxGuests;
  final String maxRooms;
  final String ownerId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Review> reviews;
  final List<Room> rooms;
  final Area area;
  final String tax;
  final int totalPrice;
  final String areaName;
  final double rating;
  final int adults;
  final int beds;
  final List<Image> images;

  DiscoverQotoonDatum({
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

  factory DiscoverQotoonDatum.fromJson(Map<String, dynamic> json) =>
      DiscoverQotoonDatum(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        unitSpace: json["unit_space"] ?? '',
        price: json["price"] ?? '',
        bathrooms: json["bathrooms"] ?? '',
        lounges: json["lounges"] ?? '',
        diningSession: json["dining_session"] ?? '',
        features: List<String>.from((json["features"] ?? []).map((x) => x)),
        view: json["view"] ?? '',
        additionalFeatures: List<String>.from(
            (json["additional_features"] ?? []).map((x) => x)),
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
        reviews: List<Review>.from(
            (json["reviews"] ?? []).map((x) => Review.fromJson(x))),
        rooms:
            List<Room>.from((json["rooms"] ?? []).map((x) => Room.fromJson(x))),
        area: Area.fromJson(json["area"] ?? {}),
        tax: json["tax"] ?? '',
        totalPrice: json["total_price"] ?? '',
        areaName: json["area_name"] ?? '',
        rating: (json["rating"] ?? 0).toDouble(),
        adults: json["adults"] ?? '',
        beds: json["beds"] ?? '',
        images: List<Image>.from(
            (json["images"] ?? '').map((x) => Image.fromJson(x))),
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

class Image {
  final int id;
  final String apartmentId;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  Image({
    required this.id,
    required this.apartmentId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] ?? 0,
        apartmentId: json["apartment_id"] ?? '',
        image: json["image"] ?? '',
        createdAt:
            DateTime.tryParse(json["created_at"] ?? '') ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(json["updated_at"] ?? '') ?? DateTime.now(),
      );
}

class Review {
  final int id;
  final String userId;
  final String apartmentId;
  final String descriptions;
  final String rating;
  final DateTime createdAt;
  final DateTime updatedAt;

  Review({
    required this.id,
    required this.userId,
    required this.apartmentId,
    required this.descriptions,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? '',
        apartmentId: json["apartment_id"] ?? '',
        descriptions: json["descriptions"] ?? '',
        rating: json["rating"] ?? '',
        createdAt:
            DateTime.tryParse(json["created_at"] ?? '') ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(json["updated_at"] ?? '') ?? DateTime.now(),
      );
}

class Room {
  final int id;
  final String roomNumber;
  final String beds;
  final String adult;
  final String child;
  final String apartmentId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Room({
    required this.id,
    required this.roomNumber,
    required this.beds,
    required this.adult,
    required this.child,
    required this.apartmentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"] ?? 0,
        roomNumber: json["room_number"] ?? '',
        beds: json["beds"] ?? '',
        adult: json["adult"] ?? '',
        child: json["child"] ?? '',
        apartmentId: json["apartment_id"] ?? '',
        createdAt:
            DateTime.tryParse(json["created_at"] ?? '') ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(json["updated_at"] ?? '') ?? DateTime.now(),
      );
}
