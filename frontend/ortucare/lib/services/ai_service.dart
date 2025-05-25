import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatService {
  static const String _chatKey = 'chat_history';
  static const String _apiUrl =
      'http://192.168.137.1/ortucare/public/api/ask-ai'; // ganti sesuai hosting/IP

  // Kirim prompt ke server & terima balasan
  static Future<String> sendMessageToServer(String prompt) async {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'prompt': prompt}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['data'] ?? 'AI tidak menjawab';
    } else {
      throw Exception('Gagal terhubung ke server');
    }
  }

  // Simpan chat ke SharedPreferences
  static Future<void> saveChatHistory(
      List<Map<String, dynamic>> messages) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = messages.map((msg) => jsonEncode(msg)).toList();
    await prefs.setStringList(_chatKey, jsonList);
  }

  // Load chat dari SharedPreferences
  static Future<List<Map<String, dynamic>>> loadChatHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList(_chatKey);
    if (jsonList != null) {
      return jsonList
          .map((msg) => jsonDecode(msg) as Map<String, dynamic>)
          .toList();
    }
    return [];
  }

  // Hapus semua chat
  static Future<void> clearChatHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_chatKey);
  }
}
