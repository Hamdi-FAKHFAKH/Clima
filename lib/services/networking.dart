import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  Networking(this.url);
  String url;

  Future getdata() async {
    http.Response reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      String data = reponse.body;
      return jsonDecode(data);
    } else {
      print(reponse.statusCode);
    }
  }
}
