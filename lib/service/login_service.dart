import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/login_model.dart';

class LoginService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    final prefs = await SharedPreferences.getInstance();
    String url = "https://ders.ozgurkurumsal.com:3445/user/Login";
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      LoginResponseModel userData =
          LoginResponseModel.fromJson(json.decode(response.body));
      // await prefs.setInt('departmentCode', userData.departmentCode ?? 0);
      // await prefs.setString('cariUnvan', userData.cariUnvan ?? '');
      await prefs.setString('data', json.encode(userData));
      return userData;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
