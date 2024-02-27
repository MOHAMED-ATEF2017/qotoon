class SearchCollectData {
  String? checkInData, checkOutData, adults, childs, cityId;
  SearchCollectData(
      {this.adults,
      this.checkInData,
      this.checkOutData,
      this.childs,
      this.cityId});
  Map<String, dynamic> toJson() => {
    "check_in_date":checkInData,
    "check_out_date":checkOutData,
    "adults":adults,
    "childs":childs,
    "city_id":cityId,
  };
}
