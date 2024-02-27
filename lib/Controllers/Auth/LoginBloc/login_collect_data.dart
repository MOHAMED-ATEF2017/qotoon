class LoginCollectData {
  String? phone;
  String? otp;

  LoginCollectData({this.otp, this.phone});

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "otp": otp,
      };
}
