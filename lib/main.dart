import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const Yadu1CPS());
}

const Color blue = Color(0xFF1266E8);
const Color darkBlue = Color(0xFF061F55);
const Color yellow = Color(0xFFFFD21F);

class Yadu1CPS extends StatefulWidget {
  const Yadu1CPS({super.key});

  @override
  State<Yadu1CPS> createState() => _Yadu1CPSState();
}

class _Yadu1CPSState extends State<Yadu1CPS> {
  final FlutterTts tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
      speak(
        'नमस्ते! Yadu 1C PS में आपका स्वागत है। '
        'Connect, Chat, Share और Earn करें।',
      );
    });
  }

  Future<void> speak(String text) async {
    await tts.setLanguage('hi-IN');
    await tts.setSpeechRate(0.48);
    await tts.setVolume(1);
    await tts.setPitch(1);
    await tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yadu 1C PS',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        scaffoldBackgroundColor: const Color(0xFFF4F7FC),
      ),
      home: HomeScreen(speak: speak),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Future<void> Function(String) speak;

  const HomeScreen({super.key, required this.speak});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;

  final titles = const [
    'Home',
    'Friends',
    'Chat',
    'Reels',
    'Study',
    'Wallet',
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(speak: widget.speak),
      const FriendsPage(),
      const ChatPage(),
      const ReelsPage(),
      const StudyPage(),
      const WalletPage(),
    ];

    return Scaffold(
      body: SafeArea(child: pages[current]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: current,
        onDestinationSelected: (value) {
          setState(() => current = value);
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
            icon: Icon(Icons.play_circle_outline),
            selectedIcon: Icon(Icons.play_circle),
            label: 'Reels',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Study',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Future<void> Function(String) speak;

  const HomePage({super.key, required this.speak});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _header(context)),
        SliverToBoxAdapter(child: _quickButtons(context)),
        SliverToBoxAdapter(child: _stories()),
        SliverToBoxAdapter(child: _createPost(context)),
        SliverToBoxAdapter(child: _post()),
        SliverToBoxAdapter(child: _studyCard(context)),
        SliverToBoxAdapter(child: _earningCard()),
        const SliverToBoxAdapter(child: SizedBox(height: 25)),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 10, 22),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [darkBlue, blue],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(28),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: const Center(
              child: Text(
                'Y1C',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yadu 1C PS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Connect • Chat • Share • Earn',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              speak('Yadu 1C PS notifications');
            },
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              _showMenu(context);
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickButtons(BuildContext context) {
    final items = [
      [Icons.people, 'Friends'],
      [Icons.chat, 'Chat'],
      [Icons.groups, 'Groups'],
      [Icons.school, 'Study'],
      [Icons.card_giftcard, 'Earn'],
    ];

    return SizedBox(
      height: 105,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (_, i) {
          return Container(
            width: 75,
            margin: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () => speak(items[i][1].toString()),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: blue.withOpacity(.12),
                    child: Icon(
                      items[i][0] as IconData,
                      color: blue,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    items[i][1].toString(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _stories() {
    final names = [
      'Add Story',
      'Ravi',
      'Neha',
      'Amit',
      'Pooja',
      'Anjali',
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (_, i) {
          return Container(
            width: 76,
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 31,
                  backgroundColor: i == 0 ? blue : Colors.orange,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white,
                    child: Text(
                      names[i][0],
                      style: const TextStyle(
                        color: blue,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  names[i],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _createPost(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 3, 12, 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: blue,
              child: Text(
                'P',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'What’s on your mind?',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.photo,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.videocam,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _post() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: blue,
                  child: Text(
                    'R',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ravi Yadav ✓',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '2h ago • Public',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Yadu 1C PS पर दोस्तों के साथ नई शुरुआत! 🔥\n'
              'Connect • Chat • Share • Earn ❤️',
            ),
            const SizedBox(height: 12),
            Container(
              height: 175,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [darkBlue, blue],
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 55,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Yadu 1C PS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Connect • Chat • Share • Earn',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text('245'),
                Spacer(),
                Text(
                  '45 Comments   12 Shares',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _button(Icons.thumb_up_alt_outlined, 'Like'),
                _button(Icons.comment_outlined, 'Comment'),
                _button(Icons.share_outlined, 'Share'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _button(IconData icon, String text) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 19),
      label: Text(text),
    );
  }

  Widget _studyCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 5),
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Color(0xFF073D88), blue],
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.school,
              color: Colors.white,
              size: 43,
            ),
            const SizedBox(width: 13),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Free Study',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Notes • Classes • Quiz • PDFs',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _earningCard() {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 7, 12, 5),
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [darkBlue, blue],
          ),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
              size: 42,
            ),
            SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Wallet',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    '₹ 2,450',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Ads • Referral • Tasks',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
              const ListTile(
                leading: Icon(Icons.groups),
                title: Text('Groups'),
              ),
              const ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              const ListTile(
                leading: Icon(Icons.security),
                title: Text('Privacy & Security'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final people = [
      'Neha Sharma',
      'Amit Kumar',
      'Pooja Singh',
      'Ravi Yadav',
      'Anjali Verma',
      'Sanjay Gupta',
    ];

    return AppPage(
      title: 'Friends & Follow',
      icon: Icons.people,
      children: [
        const SearchBox(text: 'Search people'),
        ...people.map(
          (name) => Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: blue,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text('5 mutual friends'),
              trailing: FilledButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      ['Rohit Kumar', 'भाई कैसे हो? 😊'],
      ['Neha Sharma', 'Nice post!'],
      ['Amit Kumar', 'आज ऑनलाइन हो?'],
      ['Pooja Singh', 'Good morning'],
    ];

    return AppPage(
      title: 'Private Chat',
      icon: Icons.chat,
      children: [
        const SearchBox(text: 'Search chats'),
        ...chats.map(
          (chat) => Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: blue,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                chat[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(chat[1]),
              trailing: const Icon(
                Icons.chevron_right,
              ),
              onTap: () {},
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(
              Icons.group,
            
