import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ortucare/models/user_login.dart';
import 'package:ortucare/services/url.dart' as url;
import 'package:ortucare/models/response_data_map.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future registerUser(data) async {
    var uri = Uri.parse(url.BaseUrl + "/register");
    var register = await http.post(uri, body: data);

    if (register.statusCode == 200) {
      var data = json.decode(register.body);
      if (data["status"] == true) {
        ResponseDataMap response = ResponseDataMap(
            status: true, message: "Sukses menambah user", data: data);
        return response;
      } else {
        var message = '';
        for (String key in data["message"].keys) {
          message += data["message"][key][0].toString() + '\n';
        }
        ResponseDataMap response =
            ResponseDataMap(status: false, message: message);
        return response;
      }
    } else {
      ResponseDataMap response = ResponseDataMap(
          status: false,
          message:
              "gagal menambah user dengan code error ${register.statusCode}");
      return response;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Menghapus semua data
  }

  Future<ResponseDataMap> forgotPassword(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(url.BaseUrl + "/forgot"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      final responseData = jsonDecode(response.body);
      return ResponseDataMap(
        status: responseData['status'],
        message: responseData['message'],
      );
    } catch (e) {
      return ResponseDataMap(
        status: false,
        message: 'Terjadi kesalahan saat mengirim permintaan.',
      );
    }
  }

  Future loginUser(data) async {
    var uri = Uri.parse(url.BaseUrl + "/login");
    var register = await http.post(uri, body: data);

    if (register.statusCode == 200) {
      var data = json.decode(register.body);
      print("Response: ${register.body}"); // Debug: Log response body

      if (data["status"] == true) {
        var user = data["data"]; // <- ganti dari "user" ke "data"

        if (user != null) {
          UserLogin userLogin = UserLogin(
            status: data["status"],
            token: data["authorisation"]["token"], // ambil dari "authorisation"
            message: data["message"],
            id: user["id"],
            username: user["username"],
            email: user["email"],
          );
          await userLogin.prefs();

          ResponseDataMap response = ResponseDataMap(
              status: true, message: "Sukses login user", data: data);
          return response;
        } else {
          ResponseDataMap response = ResponseDataMap(
              status: false, message: "Data user tidak ditemukan");
          return response;
        }
      } else {
        ResponseDataMap response =
            ResponseDataMap(status: false, message: 'email dan password salah');
        return response;
      }
    } else {
      ResponseDataMap response = ResponseDataMap(
          status: false,
          message:
              "gagal menambah user dengan code error ${register.statusCode}");
      return response;
    }
  }
}
