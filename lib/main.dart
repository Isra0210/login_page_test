import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:teste/src/login/login_binding.dart';
import 'package:teste/src/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Logins page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginPage.route,
      initialBinding: LoginBinding(),
    );
  }
}
