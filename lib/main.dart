import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pattern_mobx/pages/detail_page.dart';
import 'package:pattern_mobx/pages/edit_page.dart';
import 'package:pattern_mobx/pages/home_page.dart';
import 'package:pattern_mobx/stores/create_store.dart';
import 'package:pattern_mobx/stores/edit_store.dart';
import 'package:pattern_mobx/stores/home_store.dart';

void main() {
  getService();
  runApp(const MyApp());
}

void getService() {
  GetIt getIt = GetIt.instance;

  getIt.registerLazySingleton(() => HomeStore());
  getIt.registerLazySingleton(() => CreateStore());
  getIt.registerLazySingleton(() => EditStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        DetailPage.id: (context) => DetailPage(),
      },
    );
  }
}
