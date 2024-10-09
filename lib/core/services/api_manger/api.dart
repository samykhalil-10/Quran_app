import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/core/models/radio_response.dart';

class ApiManger {
  static Future<RadioResponse> getRadio() async {
    http.Response response =
        await http.get(Uri.parse("https://mp3quran.net/api/v3/radios"));

    var json = jsonDecode(response.body);
    return RadioResponse.fromJson(json);
  }
}
