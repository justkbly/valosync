import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(ValoSyncApp());

class ValoSyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValoSync',
      theme: ThemeData(
        primaryColor: Color(0xFFff4655),
        scaffoldBackgroundColor: Color(0xFF0f1923),
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  void handleRiotLogin() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Color(0xFF1e2328),
        title: Text('Riot Games Authentication', style: TextStyle(color: Colors.white)),
        content: Text(
          'RSO integration pending Riot Developer approval.\nDemo mode available for testing.',
          style: TextStyle(color: Color(0xFF9ca3af)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
            child: Text('Demo Mode'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 80),
              // Logo
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
              
              SizedBox(height: 100),
              
              // Login card
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
                      'Connect your Riot account',
                      style: TextStyle(color: Color(0xFF9ca3af)),
                    ),
                    
                    SizedBox(height: 32),
                    
                    // Riot button
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Dashboard()),
                          );
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
              
              SizedBox(height: 60),
              
              // Features
              Text(
                'Features',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFff4655),
                ),
              ),
              SizedBox(height: 20),
              
              FeatureItem(Icons.trending_up, 'Rank Tracking'),
              FeatureItem(Icons.store, 'Store Alerts'),
              FeatureItem(Icons.group, 'Team Builder'),
              FeatureItem(Icons.analytics, 'Match Analytics'),
              
              SizedBox(height: 40),
              
              // Privacy
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFff4655).withOpacity(0.1),
                  border: Border.all(color: Color(0xFFff4655), width: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '🔒 Privacy: Requires user consent for data access via RSO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              SizedBox(height: 20),
              
              Text(
                'Not affiliated with Riot Games',
                style: TextStyle(
                  color: Color(0xFF666),
                  fontSize: 10,
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

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;
  
  FeatureItem(this.icon, this.text);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF53f9ff), size: 20),
          SizedBox(width: 12),
          Text(text, style: TextStyle(color: Color(0xFF9ca3af))),
        ],
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
  
  final List<String> tabs = ['Home', 'Stats', 'Store', 'Social'];
  
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
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'demo_user#1234',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xFF53f9ff),
                  child: Text('D', style: TextStyle(fontSize: 12, color: Colors.black)),
                ),
              ],
            ),
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
          
          // Stats grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              StatCard('Rank', 'Diamond 2', '+67 RR', Colors.amber),
              StatCard('ACS', '245', '+12', Color(0xFF53f9ff)),
              StatCard('Win Rate', '67%', '+5%', Colors.green),
              StatCard('HS%', '24%', '±0%', Color(0xFF888)),
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
          
          MatchCard('Ascent', '13-9', true, '24/15/8', 'Jett'),
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
                    'Demo data - Real integration pending API approval',
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 48, color: Color(0xFF53f9ff)),
          SizedBox(height: 16),
          Text(
            'Advanced Stats',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Detailed analytics coming soon',
            style: TextStyle(color: Color(0xFF9ca3af)),
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
          Text(
            'Daily Store',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFFff4655),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                StoreItem('Phantom', 'Ion', '1775 VP'),
                StoreItem('Vandal', 'Prime', '1775 VP'),
                StoreItem('Operator', 'Dragon', '2175 VP'),
                StoreItem('Sheriff', 'Reaver', '1775 VP'),
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
  
  StoreItem(this.weapon, this.skin, this.price);
  
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
        mainAxisAlignment: MainAxisAlignment.center,
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: 48, color: Color(0xFF53f9ff)),
          SizedBox(height: 16),
          Text(
            'Social Hub',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Team building features coming soon',
            style: TextStyle(color: Color(0xFF9ca3af)),
          ),
        ],
      ),
    );
  }
}