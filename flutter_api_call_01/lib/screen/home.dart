// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_api_call_01/model/user_respons.dart';
import 'package:flutter_api_call_01/services/user_api.dart';
// import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<dynamic> users = [];
  UserRespons? userRespons;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    final UserRespons respons = await UserApi.fetchUsers();
    setState(() {
      userRespons = respons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api Call'),
      ),
      body: ListView.builder(
          itemCount: userRespons?.results?.length ?? 0,
          itemBuilder: (context, index) {
            final Result? result = userRespons?.results![index];
            // final user = users[index];
            // final name = user['name']['first'];
            // final email = user['email'];
            // final imageUrl = user['picture']['thumbnail'];
            // final name = result?.name?.fullName;
            // final email = result?.email;
            // final imageUrl = result?.picture?.thumbnail;
            // final phone = result?.phone;

            // return UserList(imageUrl: imageUrl, name: name, email: email);
            return UserListWidget(
              result: result,
            );
          }),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.close),
      //   onPressed: () {
      //     GoRouter.of(context).push('/menu'); // スタックで操作する場合
      //     // GoRouter.of(context).go('/menu'); // 現ルートと入れ替える場合
      //     // context.go('/menu'); // 現ルートと入れ替える場合
      //   },
      // ),
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

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Result? result;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(result?.picture?.thumbnail ?? '')),
      title: Text(result?.name?.fullName ?? ''),
      subtitle: Text(result?.email ?? ''),
    );
  }
}
