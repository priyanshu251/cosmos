import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url, this.planetApiKey);
  String url;
  String planetApiKey;
  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getPlanetData() async {
    http.Response response =
        await http.get(Uri.parse(url), headers: {'X-Api-Key': planetApiKey});
    if (response.statusCode == 200) {
      String data = response.body;
      final length = jsonDecode(response.body).length;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getPlanetDataLength() async {
    http.Response response =
        await http.get(Uri.parse(url), headers: {'X-Api-Key': planetApiKey});
    if (response.statusCode == 200) {
      final length = jsonDecode(response.body).length;
      return length;
    } else {
      print(response.statusCode);
    }
  }
}
