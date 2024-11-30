import 'package:flutter/material.dart';
import 'package:kryptoworx/pages/settings_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement wallet connection
            },
            child: const Text('Connect wallet', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ Colors.white, Color(0xFF102542)],
                ),
              ),
              child: Text('KryptoworX', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.launch),
              title: const Text('Send/Recieve'),
              onTap: () {
                // TODO: Navigate to Launchpad
              },
            ),
            ListTile(
              leading: const Icon(Icons.stacked_bar_chart),
              title: const Text('Live Market'),
              onTap: () {
                // TODO: Navigate to Live Market
              },
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb),
              title: const Text('Learn'),
              onTap: () {
                // TODO: Navigate to Learn
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Setting'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SettingsPage()));
                // TODO: Navigate to Setting
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: const Text('IDO Calendar'),
                subtitle: const Text('Upcoming IDOs and events'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () {
                  // TODO: Show IDO Calendar
                },
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                title: const Text('My Portfolio'),
                subtitle: const Text('View and manage your assets'),
                trailing: const Icon(Icons.pie_chart),
                onTap: () {
                  // TODO: Show Portfolio
                },
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                title: const Text('Upcoming'),
                subtitle: const Text('Upcoming events and opportunities'),
                trailing: const Icon(Icons.event),
                onTap: () {
                  // TODO: Show Upcoming events
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

