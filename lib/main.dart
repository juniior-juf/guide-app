import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/src/app/features/active/pages/active_page.dart';
import 'package:guide_app/src/app/features/active/pages/input_page.dart';
import 'package:guide_app/src/app/features/active/stores/active_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Guide App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      initialBinding: ActiveBindings(),
      getPages: [
        GetPage(
          name: '/',
          page: () => InputPage(),
          binding: ActiveBindings(),
        ),
        GetPage(
          name: '/active_page',
          page: () => ActivePage(),
          binding: ActiveBindings(),
        ),
      ],
    );
  }
}
