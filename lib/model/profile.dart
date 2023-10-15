class Profile {
  final int? status;
  final String? message;
  final Data? data;

  Profile({
    this.status,
    this.message,
    this.data,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? profileImage;

  Data({
    this.email,
    this.firstName,
    this.lastName,
    this.profileImage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "profile_image": profileImage,
  };
}
