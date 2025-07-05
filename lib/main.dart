import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(ValoSyncApp());

class ValoSyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValoSync - Ultimate Valorant Companion',
      theme: ThemeData(
        primaryColor: Color(0xFFff4655),
        scaffoldBackgroundColor: Color(0xFF0f1923),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainApp(),
        '/app': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
        '/privacy': (context) => PrivacyPolicyPage(),
        '/terms': (context) => TermsPage(),
        '/about': (context) => AboutPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getTabContent(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1e2328),
        selectedItemColor: Color(0xFFff4655),
        unselectedItemColor: Color(0xFF666),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Social'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
  
  Widget getTabContent() {
    switch (currentIndex) {
      case 0: return LandingPage();
      case 1: return StatsTab();
      case 2: return StoreTab();
      case 3: return SocialTab();
      case 4: return SettingsTab();
      default: return LandingPage();
    }
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('🎯', style: TextStyle(fontSize: 24)),
                    SizedBox(width: 8),
                    Text(
                      'ValoSync',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFff4655),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/about'),
                      child: Text('About', style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/privacy'),
                      child: Text('Privacy', style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/app'),
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFff4655)),
                      child: Text('Launch App', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Hero Section
          Container(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Text(
                  'Ultimate Valorant Companion',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'Track your performance, manage your store, and build better teams with the most comprehensive Valorant companion app.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF9ca3af),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/app'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFff4655),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      child: Text('Try Demo Now', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                    SizedBox(width: 16),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFF53f9ff)),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      child: Text('Learn More', style: TextStyle(fontSize: 16, color: Color(0xFF53f9ff))),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Features Section
          Container(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Text(
                  'Powerful Features',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFff4655),
                  ),
                ),
                SizedBox(height: 40),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: 1.2,
                  children: [
                    FeatureCard(
                      Icons.trending_up,
                      'Performance Analytics',
                      'Real-time rank tracking with detailed match analysis and improvement recommendations.',
                    ),
                    FeatureCard(
                      Icons.store,
                      'Smart Store Manager',
                      'Never miss your favorite skins with intelligent alerts and spending analytics.',
                    ),
                    FeatureCard(
                      Icons.group,
                      'Team Building',
                      'Advanced teammate matching and team formation tools for competitive play.',
                    ),
                    FeatureCard(
                      Icons.analytics,
                      'Strategic Tools',
                      'Pre-match preparation with opponent research and custom practice routines.',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Footer
          Container(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/about'),
                      child: Text('About', style: TextStyle(color: Color(0xFF9ca3af))),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/privacy'),
                      child: Text('Privacy Policy', style: TextStyle(color: Color(0xFF9ca3af))),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/terms'),
                      child: Text('Terms of Service', style: TextStyle(color: Color(0xFF9ca3af))),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  '© 2025 ValoSync. Not affiliated with Riot Games, Inc.',
                  style: TextStyle(color: Color(0xFF666), fontSize: 12),
                ),
                SizedBox(height: 8),
                Text(
                  'Built with ❤️ for the Valorant community',
                  style: TextStyle(color: Color(0xFF666), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  FeatureCard(this.icon, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFF1e2328),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF53f9ff), width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: Color(0xFF53f9ff)),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF9ca3af),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void handleRiotLogin() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Color(0xFF1e2328),
        title: Text('Riot Games Authentication', style: TextStyle(color: Colors.white)),
        content: Text(
          'RSO integration pending Riot Developer approval.\nDemo mode available for testing all features.',
          style: TextStyle(color: Color(0xFF9ca3af)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: TextStyle(color: Color(0xFF9ca3af))),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushNamed(context, '/dashboard');
            },
            child: Text('Demo Mode', style: TextStyle(color: Color(0xFFff4655))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text('🎯', style: TextStyle(fontSize: 64)),
              SizedBox(height: 16),
              Text(
                'ValoSync',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFff4655),
                ),
              ),
              Text(
                'Valorant Companion',
                style: TextStyle(color: Color(0xFF9ca3af)),
              ),
              
              SizedBox(height: 60),
              
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Color(0xFF1e2328),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF53f9ff), width: 0.5),
                ),
                child: Column(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Connect your Riot account for full features',
                      style: TextStyle(color: Color(0xFF9ca3af)),
                    ),
                    
                    SizedBox(height: 32),
                    
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: handleRiotLogin,
                        icon: Icon(Icons.security),
                        label: Text('Continue with Riot'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFff4655),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 24),
                    
                    Row(
                      children: [
                        Expanded(child: Divider(color: Color(0xFF444))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text('OR', style: TextStyle(color: Color(0xFF9ca3af))),
                        ),
                        Expanded(child: Divider(color: Color(0xFF444))),
                      ],
                    ),
                    
                    SizedBox(height: 24),
                    
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/dashboard');
                        },
                        icon: Icon(Icons.play_arrow),
                        label: Text('Try Demo'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFF53f9ff),
                          side: BorderSide(color: Color(0xFF53f9ff)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 40),
              
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFff4655).withOpacity(0.1),
                  border: Border.all(color: Color(0xFFff4655), width: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.security, color: Color(0xFFff4655), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Privacy & Data Protection',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFff4655),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ValoSync requires explicit user consent for data access via RSO. Your privacy is our priority.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentTab = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1e2328),
        title: Row(
          children: [
            Text('🎯', style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Text(
              'ValoSync',
              style: TextStyle(
                color: Color(0xFFff4655),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Color(0xFF53f9ff)),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: getTabContent(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1e2328),
        selectedItemColor: Color(0xFFff4655),
        unselectedItemColor: Color(0xFF666),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTab,
        onTap: (i) => setState(() => currentTab = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Social'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
  
  Widget getTabContent() {
    switch (currentTab) {
      case 0: return HomeTab();
      case 1: return StatsTab();
      case 2: return StoreTab();
      case 3: return SocialTab();
      case 4: return SettingsTab();
      default: return HomeTab();
    }
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            'Your Valorant overview',
            style: TextStyle(color: Color(0xFF9ca3af)),
          ),
          
          SizedBox(height: 24),
          
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              StatCard('Current Rank', 'Diamond 2', '+67 RR', Colors.amber),
              StatCard('Combat Score', '245', '+12', Color(0xFF53f9ff)),
              StatCard('Win Rate', '67%', '+5%', Colors.green),
              StatCard('Headshot %', '24%', '±0%', Color(0xFF888)),
            ],
          ),
          
          SizedBox(height: 32),
          
          Text(
            'Recent Matches',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFFff4655),
            ),
          ),
          
          SizedBox(height: 16),
          
          MatchCard('Sunset', '13-9', true, '24/15/8', 'Jett'),
          MatchCard('Bind', '11-13', false, '18/17/5', 'Sage'),
          MatchCard('Haven', '13-7', true, '31/12/6', 'Reyna'),
          
          SizedBox(height: 24),
          
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF53f9ff).withOpacity(0.1),
              border: Border.all(color: Color(0xFF53f9ff), width: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF53f9ff), size: 20),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Demo data - Real integration pending Riot API approvala',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title, value, change;
  final Color color;
  
  StatCard(this.title, this.value, this.change, this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1e2328),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF333), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Color(0xFF9ca3af), fontSize: 12)),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(change, style: TextStyle(color: Color(0xFF666), fontSize: 10)),
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String map, score, kda, agent;
  final bool won;
  
  MatchCard(this.map, this.score, this.won, this.kda, this.agent);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1e2328),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: won ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: won ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                won ? 'W' : 'L',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(map, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                Text(score, style: TextStyle(color: Color(0xFF9ca3af), fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(kda, style: TextStyle(color: Colors.white)),
              Text(agent, style: TextStyle(color: Color(0xFF53f9ff), fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class StatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Performance Analytics',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFff4655),
            ),
          ),
          SizedBox(height: 24),
          
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF1e2328),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFF53f9ff), width: 0.5),
            ),
            child: Column(
              children: [
                Icon(Icons.bar_chart, size: 64, color: Color(0xFF53f9ff)),
                SizedBox(height: 16),
                Text(
                  'Detailed Statistics Coming Soon',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Advanced analytics including:\n• Agent performance breakdowns\n• Map-specific statistics\n• Aim accuracy trends\n• Rank progression predictions',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF9ca3af)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Store',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFff4655),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF53f9ff).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Updates in 14h 23m',
                  style: TextStyle(color: Color(0xFF53f9ff), fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                StoreItem('Phantom', 'Ion', '1775 VP', true),
                StoreItem('Vandal', 'Prime', '1775 VP', false),
                StoreItem('Operator', 'Dragon', '2175 VP', false),
                StoreItem('Sheriff', 'Reaver', '1775 VP', true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoreItem extends StatelessWidget {
  final String weapon, skin, price;
  final bool isWishlisted;
  
  StoreItem(this.weapon, this.skin, this.price, this.isWishlisted);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1e2328),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isWishlisted ? Color(0xFFff4655) : Color(0xFF333), 
          width: isWishlisted ? 1 : 0.5
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 48,
                height: 32,
                decoration: BoxDecoration(
                  color: Color(0xFF53f9ff).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(Icons.sports_esports, color: Color(0xFF53f9ff), size: 20),
              ),
              if (isWishlisted)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Icon(Icons.favorite, color: Color(0xFFff4655), size: 16),
                ),
            ],
          ),
          SizedBox(height: 12),
          Text(weapon, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          Text(skin, style: TextStyle(color: Color(0xFF9ca3af), fontSize: 12)),
          SizedBox(height: 8),
          Text(price, style: TextStyle(color: Color(0xFFff4655), fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class SocialTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Social Hub',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFff4655),
            ),
          ),
          SizedBox(height: 24),
          
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF1e2328),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFF53f9ff), width: 0.5),
            ),
            child: Column(
              children: [
                Icon(Icons.people, size: 64, color: Color(0xFF53f9ff)),
                SizedBox(height: 16),
                Text(
                  'Team Building Features',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Coming soon:\n• Find compatible teammates\n• Team formation tools\n• Match result sharing\n• Community leaderboards',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF9ca3af)),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFff4655)),
                  child: Text('Join Beta', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool darkMode = true;
  bool notifications = true;
  bool analytics = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFff4655),
            ),
          ),
          SizedBox(height: 24),
          
          _buildSettingsSection('Account', [
            _buildSettingsTile(Icons.person, 'Profile', 'Manage your profile information', () {}),
            _buildSettingsTile(Icons.security, 'Privacy', 'Data and privacy settings', () {
              Navigator.pushNamed(context, '/privacy');
            }),
          ]),
          
          _buildSettingsSection('Preferences', [
            _buildSwitchTile(Icons.dark_mode, 'Dark Mode', 'Use dark theme', darkMode, (value) {
              setState(() => darkMode = value);
            }),
            _buildSwitchTile(Icons.notifications, 'Notifications', 'Push notifications', notifications, (value) {
              setState(() => notifications = value);
            }),
            _buildSwitchTile(Icons.analytics, 'Analytics', 'Help improve ValoSync', analytics, (value) {
              setState(() => analytics = value);
            }),
          ]),
          
          _buildSettingsSection('Support', [
            _buildSettingsTile(Icons.help, 'Help Center', 'Get help and support', () {}),
            _buildSettingsTile(Icons.info, 'About', 'About ValoSync', () {
              Navigator.pushNamed(context, '/about');
            }),
            _buildSettingsTile(Icons.description, 'Terms', 'Terms of Service', () {
              Navigator.pushNamed(context, '/terms');
            }),
          ]),
          
          SizedBox(height: 32),
          
          Container(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text('Sign Out', style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12),
        ...children,
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF53f9ff)),
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Color(0xFF9ca3af))),
      trailing: Icon(Icons.chevron_right, color: Color(0xFF9ca3af)),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, String subtitle, bool value, Function(bool) onChanged) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF53f9ff)),
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Color(0xFF9ca3af))),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Color(0xFFff4655),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1e2328),
        title: Text('About ValoSync', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About ValoSync',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFff4655),
              ),
            ),
            SizedBox(height: 24),
            
            Text(
              'Mission',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ValoSync aims to enhance the Valorant gaming experience by providing comprehensive tools for performance tracking, team coordination, and community engagement. We believe that data-driven insights and social connectivity can help players improve their skills and build lasting relationships.',
              style: TextStyle(color: Color(0xFF9ca3af), fontSize: 16, height: 1.5),
            ),
            
            SizedBox(height: 24),
            
            Text(
              'Developer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ValoSync is developed by an independent software engineer with a passion for both gaming and creating tools that enhance player experiences. With expertise in mobile development and data analytics, our goal is to build applications that truly serve the gaming community.',
              style: TextStyle(color: Color(0xFF9ca3af), fontSize: 16, height: 1.5),
            ),
            
            SizedBox(height: 32),
            
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1e2328),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFF53f9ff), width: 0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF53f9ff),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: support@valosync.dev',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'GitHub: github.com/justkbly/valosync',
                    style: TextStyle(color: Colors.white),
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

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1e2328),
        title: Text('Privacy Policy', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFff4655),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Last updated: January 2025',
              style: TextStyle(color: Color(0xFF9ca3af)),
            ),
            SizedBox(height: 24),
            
            _buildSection(
              'Data Collection and Usage',
              'ValoSync collects and processes Valorant game data only with explicit user consent through Riot Sign On (RSO) authentication. We collect match statistics, rank information, and store data to provide our services.',
            ),
            
            _buildSection(
              'Riot Sign On (RSO) Integration',
              'When you authenticate with Riot Games through RSO, you explicitly consent to sharing your Valorant account data with ValoSync. You can revoke this access at any time through your Riot Games account settings.',
            ),
            
            _buildSection(
              'Data Security',
              'We implement industry-standard security measures to protect your data. All communications are encrypted, and we follow best practices for data storage and access control.',
            ),
            
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFff4655).withOpacity(0.1),
                border: Border.all(color: Color(0xFFff4655), width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Important: This privacy policy applies to the demo version and will be updated with additional details upon production release with full Riot Games API integration.',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(color: Color(0xFF9ca3af), fontSize: 16, height: 1.5),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1e2328),
        title: Text('Terms of Service', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms of Service',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFff4655),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Last updated: January 2025',
              style: TextStyle(color: Color(0xFF9ca3af)),
            ),
            SizedBox(height: 24),
            
            _buildSection(
              'Service Description',
              'ValoSync is a companion application for Valorant players that provides performance tracking, store management, and social features. The service is currently in demo/beta phase.',
            ),
            
            _buildSection(
              'Account Requirements',
              'To use ValoSync, you must have a valid Riot Games account and be in good standing with Riot Games terms of service.',
            ),
            
            _buildSection(
              'Intellectual Property',
              'ValoSync respects intellectual property rights. Valorant, Riot Games, and related trademarks are property of Riot Games, Inc. ValoSync is not affiliated with or endorsed by Riot Games.',
            ),
            
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1e2328),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFF53f9ff), width: 0.5),
              ),
              child: Text(
                'Questions about these terms? Contact us at legal@valosync.dev',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(color: Color(0xFF9ca3af), fontSize: 16, height: 1.5),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}