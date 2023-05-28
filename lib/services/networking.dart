import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url, this.planetAndstarApiKey);
  String url;
  String planetAndstarApiKey;
  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getPlanetAndStarData() async {
    http.Response response = await http
        .get(Uri.parse(url), headers: {'X-Api-Key': planetAndstarApiKey});
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
