import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/log_symptoms_screen.dart';
import 'screens/medications_screen.dart';
import 'screens/community_screen.dart';
import 'screens/air_quality_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Request microphone permission
  await requestMicrophonePermission();

  runApp(const MyApp());
}

// Function to request microphone permission
Future<void> requestMicrophonePermission() async {
  final status = await Permission.microphone.request();
  print('Microphone permission status: $status');

  // You can add additional handling based on the status if needed
  if (status.isDenied) {
    print('Microphone permission was denied. Speech-to-text may not work properly.');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AllerAlert',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/log-symptoms': (context) => const LogSymptomsScreen(),
        '/medications': (context) => const MedicationsScreen(),
        '/community': (context) => const CommunityScreen(),
        '/air-quality': (context) => const AirQualityScreen()
      },
      initialRoute: '/',
    );
  }
}