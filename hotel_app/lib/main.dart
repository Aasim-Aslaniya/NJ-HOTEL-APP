import 'package:flutter/material.dart';
import 'package:hotel_app/screens/login.dart'; // Import the separate login file
import 'package:hotel_app/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NJ Residency',
      
      // ✅ GLOBAL THEME (Cream & Brown)
      theme: ThemeData(
        fontFamily: 'Roboto', 
        primaryColor: const Color(0xFF5D4037), // Dark Brown
        scaffoldBackgroundColor: const Color(0xFFFFF8E1), // Cream Background
        
        // App Bar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5D4037),
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white, 
            fontSize: 20, 
            fontWeight: FontWeight.bold,
          ),
        ),
        
        // Text Theme
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF3E2723)), // Dark Brown Text
          bodyMedium: TextStyle(color: Color(0xFF3E2723)),
        ),
      ),

      // Set LoginScreen as the home widget
      initialRoute: '/login',
      routes: {
        '/' : (context) => const DashboardScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}