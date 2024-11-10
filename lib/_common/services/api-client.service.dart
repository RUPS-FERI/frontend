import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../utils/http-status.util.dart';

abstract class ApiClientService {
  static final String _apiUrl = dotenv.env['API_URL'] ?? '';
  static final String _apiPort = dotenv.env['API_PORT'] ?? '';

  static String get _apiBaseUrl => '$_apiUrl:$_apiPort';

  static Future<Map<String, dynamic>> get(
      {required List<dynamic> endpoint,
      Map<String, String>? headers,
      Map<String, dynamic>? params}) async {
    Uri uri = Uri.http(_apiBaseUrl, '/${endpoint.join('/')}', params);
    final response = await http.get(uri, headers: headers);
    if (response.statusCode != HttpStatus.ok.code) {
      throw Exception('${response.statusCode} - $uri');
    }
    return jsonDecode(response.body);
  }
}
