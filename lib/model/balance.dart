class Balance {
  final int? status;
  final String? message;
  final Data? data;

  Balance({
    this.status,
    this.message,
    this.data,
  });

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
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
  final int? balance;

  Data({
    this.balance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
      };
}
