import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kino_app/binding/home_binding.dart';
import 'package:kino_app/binding/http_service_binding.dart';
import 'package:kino_app/core/constants/constants.dart';
import 'package:kino_app/core/constants/version_enum.dart';
import 'package:kino_app/data/network/http_service.dart';
import 'package:kino_app/routes/app_pages.dart';
import 'package:kino_app/routes/app_routes.dart';
import 'package:kino_app/ui/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  if (Constants.running == Version.wait) {
    await HttpServiceBinding().dependencies();
    await HomeBinding().dependencies();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      navigatorKey: HttpService.alice.getNavigatorKey(),
      getPages: AppPages.pages,
      defaultTransition: Transition.zoom,
      home: const HomePage(),
    );
  }
}
