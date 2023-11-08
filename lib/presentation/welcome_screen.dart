import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/application.dart';
import 'package:weather_forecast_app/presentation/weather_screen/weather_screen.dart';

import '../resources/generated/assets.gen.dart';
import 'weather_screen/bloc/weather_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    'how\'s today weather?',
                    style: TextStyle(fontSize: 24),
                  ),
                  Assets.images.iconWeatherLottie.lottie(),
                ],
              ),
            ),
            AnimatedPositionedDirectional(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              bottom: _isAnimated ? (screenHeight) : 50,
              width: _isAnimated ? (screenWidth - 32) : 240,
              start: _isAnimated ? 16 : ((screenWidth - 240) / 2),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isAnimated = !_isAnimated;
                  });
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 800),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: BlocProvider(
                              create: (context) => getIt.get<WeatherBloc>(),
                              child: const SearchWeatherScreen(),
                            )),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: const BorderSide(color: Colors.black)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Text(
                    'today weather',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
