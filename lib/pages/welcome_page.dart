import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Image.asset('lib/assets/images/logo.jvg', height: 100),
                      const SizedBox(height: 50),
                      const Text(
                        'Welcome to KryptoworX',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF102542),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Your gateway to seamless and secure cryptocurrency trading.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(19, 43, 40, 1),
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      // Image.asset('assets/images/crypto_illustration.png', height: 200),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, '/login'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: const Color(0xFF102542),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            ),
                            child: const Text('Log In'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, '/signup'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: const Color(0xFF102542),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            ),
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}