class BannerModel {
  final int? status;
  final String? message;
  final List<Data>? data;

  BannerModel({
    this.status,
    this.message,
    this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  final String? bannerName;
  final String? bannerImage;
  final String? description;

  Data({
    this.bannerName,
    this.bannerImage,
    this.description,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bannerName: json["banner_name"],
    bannerImage: json["banner_image"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "banner_name": bannerName,
    "banner_image": bannerImage,
    "description": description,
  };
}
