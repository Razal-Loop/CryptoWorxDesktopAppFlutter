import 'package:flutter/material.dart';  

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: const Color(0xFF1E1E1E), // Dark background  
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
          IconButton(  
            icon: const Icon(Icons.search),  
            onPressed: () {  
              // TODO: Implement search logic  
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
              // TODO: Implement login logic  
            },  
            child: const Text('Login', style: TextStyle(color: Colors.white)),  
          ),  
          TextButton(  
            onPressed: () {  
              // TODO: Implement register logic  
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
                    // TODO: Implement home navigation logic  
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
                  onPressed: () {  
                    // TODO: Implement refresh logic  
                  },  
                ),  
                IconButton(  
                  icon: const Icon(Icons.settings, color: Colors.white),  
                  onPressed: () {  
                    // TODO: Implement settings logic  
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
                      // TODO: Implement button logic for signing up  
                    },  
                    style: ElevatedButton.styleFrom(  
                      backgroundColor: const Color(0xFF7A92D6), // Button color  
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
                      ),  
                    ),  
                  ),  
                  const SizedBox(height: 20),  
                  const Text(  
                    'Sign up as an entity or Log in',  
                    style: TextStyle(  
                      color: Colors.white70,  
                      fontSize: 14,  
                    ),  
                  ),  
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
              child: const Text('Online Support', style: TextStyle(color: Colors.white)),  
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