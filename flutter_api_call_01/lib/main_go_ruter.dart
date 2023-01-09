// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_api_call_01/screen/home.dart';
import 'package:flutter_api_call_01/screen/menu.dart';
import 'package:go_router/go_router.dart';

void main() {
  // runApp(const MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/menu',
        builder: (context, state) => const MenuScreen(),
      ),
    ],
  );

  // @override
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     debugShowCheckedModeBanner: false, // debug表示を消す
  //     // home: HomeScreen(),
  //     home: MenuScreen(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // debug表示を消す
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Rest Api Call',
    );
  }
}
