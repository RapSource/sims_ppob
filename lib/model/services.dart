class Services {
  final int? status;
  final String? message;
  final List<Data>? data;

  Services({
    this.status,
    this.message,
    this.data,
  });

  factory Services.fromJson(Map<String, dynamic> json) => Services(
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
  final String? serviceCode;
  final String? serviceName;
  final String? serviceIcon;
  final int? serviceTariff;

  Data({
    this.serviceCode,
    this.serviceName,
    this.serviceIcon,
    this.serviceTariff,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    serviceCode: json["service_code"],
    serviceName: json["service_name"],
    serviceIcon: json["service_icon"],
    serviceTariff: json["service_tariff"],
  );

  Map<String, dynamic> toJson() => {
    "service_code": serviceCode,
    "service_name": serviceName,
    "service_icon": serviceIcon,
    "service_tariff": serviceTariff,
  };
}
