class LoginResponseModel {
  String? token;
  String? error;
  int? departmentCode;
  String? cariUnvan;
  String? tanimliLimit;
  String? guncelTuketim;
  String? kalanLimit;

  LoginResponseModel(
      {this.token,
      this.error,
      this.departmentCode,
      this.cariUnvan,
      this.tanimliLimit,
      this.guncelTuketim,
      this.kalanLimit});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json["token"] ?? "",
        error: json["error"] ?? "",
        departmentCode: json['departmentCode'] ?? 0,
        cariUnvan: json['cariUnvan'] ?? '',
        tanimliLimit: json['tanimliLimit'] ?? '',
        guncelTuketim: json['guncelTuketim'] ?? '',
        kalanLimit: json['kalanLimit'] ?? '');
  }

  Map<String, dynamic> toJson() => {
        "departmentCode": departmentCode,
        "cariUnvan": cariUnvan,
        "tanimliLimit": tanimliLimit,
        "guncelTuketim": guncelTuketim,
        "kalanLimit": kalanLimit
      };
}

class LoginRequestModel {
  String? username;
  String? password;

  LoginRequestModel({this.username, this.password});

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
