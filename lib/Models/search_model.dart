// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  final bool isSuccess;
  final List<SearchDatum> data;
  final String error;
   final Message message;

  SearchModel( {
    required this.isSuccess,
    required this.data,
     required this.error, 
     required this.message,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        isSuccess: json["isSuccess"] ?? false,
        data: json["data"] == null
            ? []
            : List<SearchDatum>.from(
                json["data"].map((x) => SearchDatum.fromJson(x))),
                 error: json['error']??'', 
                  message: Message.fromJson(json["message"]??{}),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SearchDatum {
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
  final dynamic maxGuests;
  final dynamic maxRooms;
  final dynamic ownerId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<dynamic> reviews;
  final List<dynamic> bookedApartments;
  final List<Room> rooms;
  final Area area;
  final String tax;
  final int totalPrice;
  final String areaName;
  final int rating;
  final int adults;
  final int beds;
  final List<SearchImage> images;

  SearchDatum({
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
    required this.bookedApartments,
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

  factory SearchDatum.fromJson(Map<String, dynamic> json) => SearchDatum(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        unitSpace: json["unit_space"] ?? '',
        price: json["price"] ?? '',
        bathrooms: json["bathrooms"] ?? '',
        lounges: json["lounges"] ?? '',
        diningSession: json["dining_session"] ?? '',
        features: List<String>.from((json["features"] ?? ['']).map((x) => x)),
        view: json["view"] ?? '',
        additionalFeatures: List<String>.from(
            (json["additional_features"] ?? ['']).map((x) => x)),
        areaId: json["area_id"] ?? '',
        video: json["video"] ?? '',
        parking: json["parking"] ?? '',
        maxGuests: json["max_guests"] ?? '',
        maxRooms: json["max_rooms"] ?? '',
        ownerId: json["owner_id"] ?? '',
        status: json["status"] ?? '',
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        bookedApartments:
            List<dynamic>.from(json["booked_apartments"].map((x) => x)),
        rooms: List<Room>.from((json["rooms"] ??
                [
                  Room(
                          id: 0,
                          roomNumber: '',
                          beds: '',
                          adult: '',
                          child: '',
                          apartmentId: '',
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now())
                      .toJson()
                ])
            .map((x) => Room.fromJson(x))),
        area: Area.fromJson(json["area"] ?? {}),
        tax: json["tax"] ?? '',
        totalPrice: json["total_price"] ?? '',
        areaName: json["area_name"] ?? '',
        rating: json["rating"] ?? '',
        adults: json["adults"] ?? '',
        beds: json["beds"] ?? '',
        images:
            List<SearchImage>.from((json["images"]?? [
              SearchImage(id: 0, apartmentId: '', image: 'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg',
               createdAt: DateTime.now(), updatedAt: DateTime.now())
            ]).map((x) => SearchImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "unit_space": unitSpace,
        "price": price,
        "bathrooms": bathrooms,
        "lounges": lounges,
        "dining_session": diningSession,
        "features": List<dynamic>.from(features.map((x) => x)),
        "view": view,
        "additional_features":
            List<dynamic>.from(additionalFeatures.map((x) => x)),
        "area_id": areaId,
        "video": video,
        "parking": parking,
        "max_guests": maxGuests,
        "max_rooms": maxRooms,
        "owner_id": ownerId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "booked_apartments": List<dynamic>.from(bookedApartments.map((x) => x)),
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
        "area": area.toJson(),
        "tax": tax,
        "total_price": totalPrice,
        "area_name": areaName,
        "rating": rating,
        "adults": adults,
        "beds": beds,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
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
        id: json["id"]??0,
        name: json["name"]??'',
        cityId: json["city_id"]??'',
        createdAt: DateTime.tryParse(json["created_at"])??DateTime.now(),
        updatedAt: DateTime.tryParse(json["updated_at"])??DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city_id": cityId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class SearchImage {
  final int id;
  final String apartmentId;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  SearchImage({
    required this.id,
    required this.apartmentId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SearchImage.fromJson(Map<String, dynamic> json) => SearchImage(
        id: json["id"]??0,
        apartmentId: json["apartment_id"]??'',
        image: json["image"]??'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg',
        createdAt: DateTime.tryParse(json["created_at"])??DateTime.now(),
        updatedAt: DateTime.tryParse(json["updated_at"])??DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "apartment_id": apartmentId,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
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
        id: json["id"]??0,
        roomNumber: json["room_number"]??'',
        beds: json["beds"]??'',
        adult: json["adult"]??'',
        child: json["child"]??'',
        apartmentId: json["apartment_id"]??'',
        createdAt: DateTime.tryParse(json["created_at"])??DateTime.now(),
        updatedAt: DateTime.tryParse(json["updated_at"])??DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "beds": beds,
        "adult": adult,
        "child": child,
        "apartment_id": apartmentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
class Message {
    final List<String> checkOutDate;

    Message({
        required this.checkOutDate,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        checkOutDate: List<String>.from((json["check_out_date"]??['']).map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "check_out_date": List<dynamic>.from(checkOutDate.map((x) => x)),
    };
}