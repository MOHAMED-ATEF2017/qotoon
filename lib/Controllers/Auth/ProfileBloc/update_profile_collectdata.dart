class UpdateProfileCollectData {
  String? name, phone, email;
  UpdateProfileCollectData({this.email, this.phone, this.name});
  Map<String, dynamic> toJson() =>
      {'name': name, "phone": phone, "email": email};
}
