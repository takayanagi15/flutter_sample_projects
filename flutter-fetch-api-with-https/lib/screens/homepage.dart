import 'package:api_future/model/user_model.dart';
import 'package:api_future/screens/detail_page.dart';

import 'package:api_future/services/user_service.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: ApiService().getUser(),
          builder: (context, snapshot) {
            List<UserModel>? data = snapshot.data;
            if (snapshot.hasData) {
              return ListView(
                children: [
                  ...data!.map((e) => InkWell(
                        child: ListTile(
                          title: Text(e.firstname),
                          subtitle: Text(e.lastname),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(e.avatar),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              e: e,
                            ),
                          ),
                        ),
                      ))
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
