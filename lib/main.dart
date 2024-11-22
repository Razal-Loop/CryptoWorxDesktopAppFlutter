import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'app_theme.dart';

import 'dart:convert';
import 'pages/welcome_page.dart';
import 'pages/settings_page.dart';
import 'pages/signup_page.dart';
import 'pages/login_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KryptoworX',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/settings': (context) => const SettingsPage(),
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}

// API service to handle backend requests
class ApiService {
  static const String baseUrl = 'http://localhost:8080';

  static Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: json.encode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Login successful');
      return true;
    } else {
      print('Login failed');
      return false;
    }
  }

  static Future<bool> signup(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      body: json.encode({'username': username, 'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Signup successful');
      return true;
    } else {
      print('Signup failed');
      return false;
    }
  }

  static Future<bool> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/forgot-password'),
      body: json.encode({'email': email}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Password reset email sent');
      return true;
    } else {
      print('Failed to send password reset email');
      return false;
    }
  }
}