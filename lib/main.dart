import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Removed webview_flutter import since it's no longer needed.
import 'app_theme.dart'; // Ensure this file is created and contains your theme
import 'pages/welcome_page.dart';
import 'pages/settings_page.dart';
import 'pages/signup_page.dart';
import 'pages/login_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/wallet_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KryptoWorX',
      theme: AppTheme.theme,  // Ensure AppTheme is defined
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/settings': (context) => const SettingsPage(),
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/wallet': (context) => const WalletPage(),  // Added wallet page route
      },
    );
  }
}

// API service to handle backend requests
class ApiService {
  static const String baseUrl = 'http://localhost:8080'; // Base API URL

  // Login method
  static Future<bool> login(String username, String password) async {
    return await _postRequest('/login', {
      'username': username,
      'password': password,
    });
  }

  // Signup method
  static Future<bool> signup(String username, String email, String password) async {
    return await _postRequest('/signup', {
      'username': username,
      'email': email,
      'password': password,
    });
  }

  // Forgot password method
  static Future<bool> forgotPassword(String email) async {
    return await _postRequest('/forgot-password', {
      'email': email,
    });
  }

  // Generic POST request handler
  static Future<bool> _postRequest(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        print('$endpoint successful');
        return true;
      } else {
        print('$endpoint failed: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during $endpoint: $e');
      return false;
    }
  }

  // Example of a GET request (if needed in future)
  static Future<dynamic> getRequest(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('GET request failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during GET request: $e');
      return null;
    }
  }
}
