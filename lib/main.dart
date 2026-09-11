import 'package:flutter/material.dart';

void main() {
  runApp(const Yadu1C());
}

class Yadu1C extends StatelessWidget {
  const Yadu1C({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yadu 1C',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xfff5f7fb),
      ),
      home: const SplashScreen(),
    );
  }
}

// ---------------- SPLASH ----------------

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff061a55), Color(0xff0878ed)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 20,
                      spreadRadius: 3,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Y1C',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Yadu 1C',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Connect • Chat • Share • Earn',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 35),
              const CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- LOGIN ----------------

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Yadu 1C')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Create Your Account',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),

            TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email (Optional)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainScreen()),
                  );
                },
                child: const Text(
                  'Sign Up / Login',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 15),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.g_mobiledata),
              label: const Text('Continue with Google'),
            ),

            const SizedBox(height: 8),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.facebook),
              label: const Text('Continue with Facebook'),
            ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MainScreen()),
                );
              },
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- MAIN ----------------

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  final pages = const [
    HomePage(),
    FriendsPage(),
    ChatPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yadu 1C',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WalletPage()),
              );
            },
          ),
        ],
      ),

      body: pages[index],

      floatingActionButton: index == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreatePostPage()),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,

      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          setState(() => index = value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Friends',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_none),
            selectedIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ---------------- HOME FEED ----------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
