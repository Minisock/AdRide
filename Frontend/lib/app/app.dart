
import 'package:app/features/splashscreen/routes.dart';
import 'package:app/features/splashscreen/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home, // Set initial route
      onGenerateRoute: AppRoutes.generateRoute, // Route generator
     
    );
  }
}
