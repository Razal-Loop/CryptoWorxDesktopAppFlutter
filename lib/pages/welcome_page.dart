// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kryptoworx/pages/dashboard_page.dart';
import 'package:kryptoworx/pages/settings_page.dart';
import 'custom_search_delegate.dart';
import 'signup_page.dart';
//import 'refresh.dart';
//import 'package:crypto_market/crypto_market.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Simulate some data that can be refreshed

  // This function simulates a refresh of the content
  Future<void> _refreshContent() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate delay
    setState(() {
// Update the counter or refresh data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 64, 122), // Dark background
      appBar: AppBar(
        title: const Text('KryptoWorX'),
        backgroundColor: const Color(0xFF2B2B2B),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // TODO: Implement back navigation logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // TODO: Implement forward navigation logic
            },
          ),
          // Search Icon to trigger search bar
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(), // Use the CustomSearchDelegate
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement alerts logic
            },
          ),
          TextButton(
            onPressed: () {
              // Navigate to the LoginPage when the button is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text('Login', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              // Navigate to the RegisterPage when the button is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpPage()),
              );
            },
            child: const Text('Register', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            icon: const Icon(Icons.minimize),
            onPressed: () {
              // TODO: Implement minimize window logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.window),
            onPressed: () {
              // TODO: Implement cascade window logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // TODO: Implement close window logic
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Left Navigation Bar
          Container(
            width: 60,
            color: const Color(0xFF2B2B2B),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    // Navigate to the DashboardPage when the button is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardPage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.trending_up, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement markets navigation logic
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.attach_money, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement buy crypto logic
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.swap_horiz, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement trade logic
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.business, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement futures logic
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.list, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement all logic
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  onPressed: _refreshContent, // Trigger refresh when button is pressed
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    // Navigate to the SettingsPage when the button is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Join for Safe and Sturdy Trading Experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '413', // Number of cryptocurrencies
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Cryptocurrencies listed',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '0.15%', // Lowest transaction fees
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Lowest transaction fees',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the SignUpPage when the button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 81, 120, 226), // Button color
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Already have an account',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the LoginPage when the button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF2B2B2B),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                // TODO: Implement edit logic
              },
            ),
            const Text(
              'Live Trading Pair Data', // Placeholder for actual data
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement online support logic
              },
              child: const Text('Online Support',
                  style: TextStyle(color: Colors.white)),
            ),
            const Text(
              '09:04:26', // Placeholder for live time
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
