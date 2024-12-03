import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';  // Import WebView
import 'app_theme.dart'; // Ensure this file is created and contains your theme
import 'pages/welcome_page.dart';
import 'pages/settings_page.dart';
import 'pages/signup_page.dart';
import 'pages/login_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/wallet_page.dart'; // Added wallet page if needed later

void main() {
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

// Add TradingView ticker widget functionality
class TradingViewTickerWidget extends StatelessWidget {
  const TradingViewTickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The WebView widget to display the TradingView ticker
    return SizedBox(
      height: 60, // Set the height of the ticker bar
      child: WebView(
        initialUrl: Uri.dataFromString(
          '''
          <html>
            <head>
              <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async></script>
            </head>
            <body style="margin: 0; padding: 0;">
              <div class="tradingview-widget-container">
                <div class="tradingview-widget-container__widget"></div>
                <div class="tradingview-widget-copyright">
                  <a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank">
                    <span class="blue-text">Track all markets on TradingView</span>
                  </a>
                </div>
              </div>
              <script type="text/javascript">
              new TradingView.widget({
                "symbols": [
                  {"proName": "FOREXCOM:SPXUSD", "title": "S&P 500 Index"},
                  {"proName": "FOREXCOM:NSXUSD", "title": "US 100 Cash CFD"},
                  {"proName": "FX_IDC:EURUSD", "title": "EUR to USD"},
                  {"proName": "BITSTAMP:BTCUSD", "title": "Bitcoin"},
                  {"proName": "BITSTAMP:ETHUSD", "title": "Ethereum"}
                ],
                "showSymbolLogo": true,
                "isTransparent": false,
                "displayMode": "adaptive",
                "colorTheme": "dark",
                "locale": "en"
              });
              </script>
            </body>
          </html>
          ''',
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8'),
        ).toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
