import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();
  final _baseUrl = "http://api.56gps.com/weixin/";

  Future<bool> login() async {
    final response = await client.get("$_baseUrl");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return response.body.toString().length > 15;
    } else {
      throw Exception('Failed to Login');
    }
  }
}