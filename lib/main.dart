import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_forecast_app/application.dart';

import 'presentation/welcome_screen.dart';

Future<void> main() async {
  await WeatherApplication.configure();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const WelcomeScreen(),
    );
  }
}
