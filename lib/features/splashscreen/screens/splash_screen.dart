import 'package:app/features/authentication/presentation/screens/login_body.dart';
import 'package:app/shared/widgets/images/image.dart';
import 'package:flutter/material.dart';
import 'package:app/core/constants/icons.dart'; // Ensure the correct path to AppIcons class


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _screenState = 0; // Track the current state of the splash screen

  @override
  void initState() {
    super.initState();
    _startSplashSequence();
  }

  void _startSplashSequence() async {
    // Delay for first state (White screen with yellow dot)
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _screenState = 1; // Transition to yellow screen
    });

    // Delay for second state (Full yellow screen)
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _screenState = 2; // Transition to yellow screen with app text
    });

    // Delay before navigating to the next screen
    await Future.delayed(const Duration(seconds: 2));
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    // Navigate to the next screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const LoginBody()), // Replace with your next screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      body: Center(
        child: _buildSplashContent(),
      ),
    );
  }

  // Determine the background color based on the current state
  Color _getBackgroundColor() {
    if (_screenState == 0) {
      return Colors.white;
    } else {
      return const Color(0xFFFFE082); // Yellow color
    }
  }

  // Build the content of the splash screen based on the current state
  Widget _buildSplashContent() {
    if (_screenState == 0) {
      return const YellowDot();
    } else if (_screenState == 1) {
      return const SizedBox(); // Empty yellow screen
    } else {
      return const AppLogo(); // Your app logo or text
    }
  }
}

class YellowDot extends StatelessWidget {
  const YellowDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: const BoxDecoration(
        color: Color(0xFFFFE082), // Yellow color
        shape: BoxShape.circle,
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:CustomImage(imagePath:Images.appImage ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Next Screen")),
      body: const Center(child: Text("Welcome to the Next Screen!")),
    );
  }
}
