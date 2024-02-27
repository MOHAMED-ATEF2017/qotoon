class InvestCollectData {
  String? name, bathrooms, lounges, view, cityID, maxRooms, price;
  InvestCollectData({
    this.cityID,
    this.bathrooms,
    this.lounges,
    this.maxRooms,
    this.name,
    this.price,
    this.view,
  });
  Map<String, dynamic> toJson() => {
        "name": name,
        "bathrooms": bathrooms,
        "lounges": lounges,
        "view": view,
        "city_id": cityID,
        "max_rooms": maxRooms,
        "price": price,
      };
}
