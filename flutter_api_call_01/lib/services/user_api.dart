import 'package:http/http.dart' as http;

import '../model/user_respons.dart';

class UserApi {
  static Future<UserRespons> fetchUsers() async {
    UserRespons userRespons;

    // print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    // final json = jsonDecode(body);

    // users = json['results'];
    userRespons = userResponsFromJson(body)!;

    // print('fetchUsers complted');

    return userRespons;
  }
}
