import 'package:flutter_api_call_01/model/menu_resopns.dart';
import 'package:http/http.dart' as http;

class MenuApi {
  static Future<MenuRespons> fetchData({required String token}) async {
    MenuRespons respons;

    // print('token=$token');
    String url =
        'https://userpage.azurewebsites.net/api/GetSystemMenu?code=iTAx69vL%2FUuhBflxh82uUiwSd1XaFAneFbFWs%2FOhpJT5jKgzK85vbg%3D%3D&env=prod&token=$token';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    // final json = jsonDecode(body);

    respons = menuResponsFromJson(body)!;

    // print('fetchUsers complted');

    return respons;
  }
}
