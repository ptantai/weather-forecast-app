import 'package:flutter/material.dart';
import 'package:weather_forecast_app/presentation/weather_screen/weather_screen.dart';

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
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'how\'s today weather?',
                      style: TextStyle(fontSize: 24),
                    ),
                    Expanded(
                      child: FlutterLogo(
                        style: FlutterLogoStyle.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPositionedDirectional(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 600),
                bottom: _isAnimated ? (screenHeight) : 0,
                width: _isAnimated ? (screenWidth - 32) : 240,
                start: _isAnimated ? 16 : ((screenWidth - 240) / 2),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isAnimated = !_isAnimated;
                    });
                    await Future.delayed(const Duration(milliseconds: 600));
                    Navigator.of(context).pushReplacement(PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 600),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 1),
                                end: Offset.zero,
                              ).animate(animation),
                              child: const SearchWeatherScreen()),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: Text(
                      'today weather',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
