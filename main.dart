import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:skycargo/controller_binding.dart';
import 'package:skycargo/sing_up_pos.dart';
import 'package:skycargo/splace_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Controllerbinding(),
      debugShowCheckedModeBanner: false,
      home: Splace_screen()
    );
  }
}
