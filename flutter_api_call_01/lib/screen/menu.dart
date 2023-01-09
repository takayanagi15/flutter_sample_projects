import 'package:flutter/material.dart';
import 'package:flutter_api_call_01/model/menu_resopns.dart';
import 'package:flutter_api_call_01/services/menu_api.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // List<dynamic> users = [];
  MenuRespons? res;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    const tokenStr = '52fd04bc-da9b-4a11-b9cf-fb4c46cafa8b';
    final MenuRespons respons = await MenuApi.fetchData(token: tokenStr);
    setState(() {
      res = respons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api Call'),
      ),
      body: ListView.builder(
          itemCount: res?.menuList?.length ?? 0,
          itemBuilder: (context, index) {
            // final MenuList menu = res?.menuList![index];
            final menu = res?.menuList![index];
            final menuTitle = menu!.title;
            final menuSubTitle = menu.subTitle;
            // final user = users[index];
            // final name = user['name']['first'];
            // final email = user['email'];
            // final imageUrl = user['picture']['thumbnail'];
            // final name = result?.name?.fullName;
            // final email = result?.email;
            // final imageUrl = result?.picture?.thumbnail;
            // final phone = result?.phone;

            return ListTile(
              title: Text(menuTitle ?? ''),
              subtitle: Text(menuSubTitle ?? ''),
            );
          }),
    );
  }

  // Future<void> fetchUsers() async {
  //   print('fetchUsers called');
  //   const url = 'https://randomuser.me/api/?results=50';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);

  //   setState(() {
  //     // users = json['results'];
  //     userRespons = userResponsFromJson(body)!;
  //   });

  //   print('fetchUsers complted');
  // }
}
