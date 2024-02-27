class LoginModel {
  final String accessToken;
  final String message;
  final String success;
  final String error;
  final LoginData data;
  final int expiresIn;

  LoginModel(
      {required this.success,
      required this.error,
      required this.accessToken,
      required this.data,
      required this.expiresIn,
      required this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"] ?? '',
        data: LoginData.fromJson(
          json["data"] ?? {},
        ),
        expiresIn: json["expires_in"] ?? 0,
        message: json["message"] ?? '',
        error: json['error'].toString(),
        success: json['success'] ?? 'false',
      );
}

class LoginData {
  final int id;
  final String name;
  final String email;
  final dynamic apiToken;
  final dynamic image;
  final String phone;
  final dynamic otp;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String status;

  LoginData({
    required this.id,
    required this.name,
    required this.email,
    required this.apiToken,
    required this.image,
    required this.phone,
    required this.otp,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        apiToken: json["api_token"] ?? '',
        image: json["image"] ?? '',
        phone: json["phone"] ?? '',
        otp: json["otp"] ?? '',
        type: json["type"] ?? '',
        createdAt:
            DateTime.tryParse(json["created_at"] ?? '') ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(json["updated_at"] ?? '') ?? DateTime.now(),
        status: json["status"] ?? '',
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "api_token": apiToken,
        "image": image,
        "phone": phone,
        "otp": otp,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
      };
}
