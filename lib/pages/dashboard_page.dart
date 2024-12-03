import 'package:flutter/material.dart';
import 'package:kryptoworx/pages/wallet_page.dart';

import 'order_page.dart';

// MyApp Module  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Trading Platform',
      theme: ThemeData(
        
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromARGB(0, 248, 244, 244), // Button background color
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: const DashboardPage(),
    );
  }
}

// HomePage Module  
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Trading Platform'),
        backgroundColor: const Color(0xFF1B1B1B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Section
            const Text(
              'Account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AccountButton(
                  icon: Icons.account_balance_wallet,
                  label: 'Wallet',
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WalletPage()),
                    )
                  },
                ),
                AccountButton(
                  icon: Icons.list,
                  label: 'Orders',
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)  => const OrdersPage()),
                    )
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Product Section
            const Text(
              'Product',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // 3 buttons in a row
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  ProductButton(
                    icon: Icons.swap_horiz,
                    label: 'Convert',
                    onPressed: () => print('Convert pressed'),
                  ),
                  ProductButton(
                    icon: Icons.trending_up,
                    label: 'KryptoWorX Earn',
                    onPressed: () => print('Binance Earn pressed'),
                  ),
                  ProductButton(
                    icon: Icons.launch,
                    label: 'Launchpad',
                    onPressed: () => print('Launchpad pressed'),
                  ),
                  ProductButton(
                    icon: Icons.money_off,
                    label: 'Crypto Loans',
                    onPressed: () => print('Crypto Loans pressed'),
                  ),
                  ProductButton(
                    icon: Icons.trending_flat,
                    label: 'Leveraged Tokens',
                    onPressed: () => print('Leveraged Tokens pressed'),
                  ),
                  ProductButton(
                    icon: Icons.pool,
                    label: 'Binance Pool',
                    onPressed: () => print('Binance Pool pressed'),
                  ),
                  ProductButton(
                    icon: Icons.article,
                    label: 'News',
                    onPressed: () => print('News pressed'),
                  ),
                  ProductButton(
                    icon: Icons.visibility,
                    label: 'Binance Live',
                    onPressed: () => print('Binance Live pressed'),
                  ),
                  ProductButton(
                    icon: Icons.settings,
                    label: 'Options',
                    onPressed: () => print('Options pressed'),
                  ),
                  ProductButton(
                    icon: Icons.savings,
                    label: 'Simple Earn',
                    onPressed: () => print('Simple Earn pressed'),
                  ),
                  ProductButton(
                    icon: Icons.settings_remote,
                    label: 'Trading Bots',
                    onPressed: () => print('Trading Bots pressed'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for account buttons  
class AccountButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const AccountButton(
      {Key? key, required this.icon, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: const Color.fromARGB(255, 24, 109, 236), // Add background color
            shadowColor: const Color.fromARGB(255, 5, 5, 5), // Add shadow effect
            elevation: 6, // Shadow effect
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white, // Icon color
                size: 20,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget for product buttons  
class ProductButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ProductButton(
      {Key? key, required this.icon, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(10),
        backgroundColor: const Color.fromARGB(255, 24, 109, 236),
        shadowColor: const Color.fromARGB(255, 13, 13, 14),
        elevation: 6,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white, // Icon color
            size: 20,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
