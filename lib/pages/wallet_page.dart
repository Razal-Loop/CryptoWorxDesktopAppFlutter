// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<CryptoAsset> assets = [
    CryptoAsset('Bitcoin', 'BTC', 32000.50, 0.75),
    CryptoAsset('Ethereum', 'ETH', 2000.30, 2.5),
    CryptoAsset('Cardano', 'ADA', 1.20, 1000),
    CryptoAsset('Polkadot', 'DOT', 15.80, 100),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate total balance safely
    double totalBalance = assets.isNotEmpty
    ? assets.fold(0.0, (sum, asset) => sum + (asset.totalValue.toDouble()))
    : 0.0;



    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Crypto Wallet',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              BalanceCard(totalBalance: totalBalance),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Portfolio',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white.withOpacity(0.5),
                        tabs: const [
                          Tab(text: 'Assets'),
                          Tab(text: 'Activity'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            AssetsList(assets: assets),
                            const ActivityList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add new asset functionality
        },
        backgroundColor: const Color(0xFF4A00E0),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// The BalanceCard widget showing total balance
class BalanceCard extends StatelessWidget {
  final double totalBalance;

  const BalanceCard({Key? key, required this.totalBalance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Balance',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${NumberFormat('#,##0.00').format(totalBalance)}',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement deposit functionality
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Deposit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement withdraw functionality
                },
                icon: const Icon(Icons.remove, color: Colors.white),
                label: const Text('Withdraw'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// List of assets in the user's wallet
class AssetsList extends StatelessWidget {
  final List<CryptoAsset> assets;

  const AssetsList({Key? key, required this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) {
          final asset = assets[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: AssetTile(asset: asset),
            ),
          );
        },
      ),
    );
  }
}

// Individual asset tile displaying its information
class AssetTile extends StatelessWidget {
  final CryptoAsset asset;

  const AssetTile({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.1),
        child: Text(
          asset.symbol,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        asset.name,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      subtitle: Text(
        '${asset.amount} ${asset.symbol}',
        style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.7)),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$${NumberFormat('#,##0.00').format(asset.totalValue)}',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$${NumberFormat('#,##0.00').format(asset.price)}',
            style: GoogleFonts.poppins(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// List of recent activities in the wallet
class ActivityList extends StatelessWidget {
  const ActivityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.1),
            child: Icon(
              index % 2 == 0 ? Icons.arrow_upward : Icons.arrow_downward,
              color: index % 2 == 0 ? Colors.green : Colors.red,
            ),
          ),
          title: Text(
            index % 2 == 0 ? 'Received Bitcoin' : 'Sent Ethereum',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          subtitle: Text(
            '2023-06-${10 + index}',
            style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.7)),
          ),
          trailing: Text(
            index % 2 == 0 ? '+0.005 BTC' : '-0.05 ETH',
            style: GoogleFonts.poppins(
              color: index % 2 == 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

// Data model for a cryptocurrency asset
class CryptoAsset {
  final String name;
  final String symbol;
  final double price;
  final double amount;
  late final double totalValue; // Changed to late initialization

  CryptoAsset(this.name, this.symbol, this.price, this.amount) {
    totalValue = price * amount; // Calculate totalValue
  }
}