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
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
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

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  int currentIndex = 0;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            LandingPage(),
            StatsTab(),
            StoreTab(),
            SocialTab(),
            SettingsTab(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Color(0xFF1e2328),
          child: SafeArea(
            top: false,
            child: TabBar(
              indicatorColor: Color(0xFFff4655),
              labelColor: Color(0xFFff4655),
              unselectedLabelColor: Color(0xFFFF6666),
              tabs: [
                Tab(icon: Icon(Icons.home_rounded, size: 20), text: 'Home'),
                Tab(icon: Icon(Icons.analytics_rounded, size: 20), text: 'Stats'),
                Tab(icon: Icon(Icons.storefront_rounded, size: 20), text: 'Store'),
                Tab(icon: Icon(Icons.people_rounded, size: 20), text: 'Social'),
                Tab(icon: Icon(Icons.settings_rounded, size: 20), text: 'Settings'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with TickerProviderStateMixin {
  late AnimationController _heroController;
  late AnimationController _featuresController;
  late Animation<double> _heroAnimation;
  late Animation<double> _featuresAnimation;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    
    _heroController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _featuresController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    
    _heroAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _heroController, curve: Curves.easeOutCubic),
    );
    
    _featuresAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _featuresController, curve: Curves.easeOutCubic),
    );
    
    // Start animations
    _heroController.forward();
    Future.delayed(Duration(milliseconds: 400), () {
      _featuresController.forward();
    });
  }

  @override
  void dispose() {
    _heroController.dispose();
    _featuresController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFFff4655), Color(0xFFe63946)],
                                ),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFff4655).withOpacity(0.3),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text('🎯', style: TextStyle(fontSize: 14)),
                                                          ),
                              SizedBox(width: 6),
                              Flexible(
                              child: Text(
                                'ValoSync',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFff4655),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFff4655), Color(0xFFe63946)],
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFff4655).withOpacity(0.3),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                HapticFeedback.lightImpact();
                                Navigator.pushNamed(context, '/app');
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                child: Text(
                                  'Launch',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    children: [
                      _buildHeaderButton('About', () => Navigator.pushNamed(context, '/about')),
                      _buildHeaderButton('Privacy', () => Navigator.pushNamed(context, '/privacy')),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Hero Section
          SliverToBoxAdapter(
            child: AnimatedBuilder(
              animation: _heroAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 30 * (1 - _heroAnimation.value)),
                  child: Opacity(
                    opacity: _heroAnimation.value,
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width < 600 ? 20 : 40),
                      child: Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [Color(0xFFff4655), Color(0xFF53f9ff)],
                            ).createShader(bounds),
                            child: Text(
                              'Ultimate Valorant Companion',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width < 600 ? 28 : 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Track your performance, manage your store, and build better teams with the most comprehensive Valorant companion app.',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width < 600 ? 14 : 18,
                              color: Color(0xFF9ca3af),
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 24),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _buildHeroButton(
                                'Try Demo Now',
                                true,
                                () => Navigator.pushNamed(context, '/app'),
                              ),
                              _buildHeroButton(
                                'Learn More',
                                false,
                                () => _scrollToFeatures(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Features Section
          SliverToBoxAdapter(
            child: AnimatedBuilder(
              animation: _featuresAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 50 * (1 - _featuresAnimation.value)),
                  child: Opacity(
                    opacity: _featuresAnimation.value,
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width < 600 ? 20 : 40),
                      child: Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [Color(0xFFff4655), Color(0xFFe63946)],
                            ).createShader(bounds),
                            child: Text(
                              'Powerful Features',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width < 600 ? 24 : 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width < 600 ? 24 : 40),
                          GridView.count(
                            crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: MediaQuery.of(context).size.width < 600 ? 2.5 : 1.1,
                            children: [
                              _buildFeatureCard(
                                Icons.trending_up_rounded,
                                'Performance Analytics',
                                'Real-time rank tracking with detailed match analysis and improvement recommendations.',
                                0,
                              ),
                              _buildFeatureCard(
                                Icons.storefront_rounded,
                                'Smartest Store Manager',
                                'Never miss your favorite skins with intelligent alerts and spending analytics.',
                                1,
                              ),
                              _buildFeatureCard(
                                Icons.people_rounded,
                                'Team Building',
                                'Advanced teammate matching and team formation tools for competitive play.',
                                2,
                              ),
                              _buildFeatureCard(
                                Icons.psychology_rounded,
                                'Strategic Tools',
                                'Pre-match preparation with opponent research and custom practice routines.',
                                3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Footer
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width < 600 ? 20 : 40),
              child: Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      _buildFooterLink('About', () => Navigator.pushNamed(context, '/about')),
                      _buildFooterLink('Privacy Policy', () => Navigator.pushNamed(context, '/privacy')),
                      _buildFooterLink('Terms of Service', () => Navigator.pushNamed(context, '/terms')),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '© 2025 ValoSync. Not affiliated with Riot Games, Inc.',
                    style: TextStyle(color: Color(0xFF666), fontSize: 11),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Built with ❤️ for the Valorant community',
                    style: TextStyle(color: Color(0xFF666), fontSize: 11),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton(String text, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildHeroButton(String text, bool isPrimary, VoidCallback onTap) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Container(
          decoration: BoxDecoration(
            gradient: isPrimary ? LinearGradient(
              colors: [Color(0xFFff4655), Color(0xFFe63946)],
            ) : null,
            border: isPrimary ? null : Border.all(color: Color(0xFF53f9ff), width: isSmallScreen ? 1 : 2),
            borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 16),
            boxShadow: isPrimary ? [
              BoxShadow(
                color: Color(0xFFff4655).withOpacity(0.3),
                blurRadius: isSmallScreen ? 8 : 12,
                offset: Offset(0, isSmallScreen ? 2 : 4),
              ),
            ] : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 16),
              onTap: () {
                HapticFeedback.mediumImpact();
                onTap();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 24 : 32, 
                  vertical: isSmallScreen ? 12 : 16
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: isPrimary ? Colors.white : Color(0xFF53f9ff),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description, int index) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600 + (index * 100)),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (context, double value, child) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1e2328),
                    Color(0xFF252a30),
                  ],
                ),
                borderRadius: BorderRadius.circular(isSmallScreen ? 16 : 20),
                border: Border.all(
                  color: Color(0xFF53f9ff).withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: isSmallScreen ? 6 : 10,
                    offset: Offset(0, isSmallScreen ? 2 : 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF53f9ff), Color(0xFF4cc9f0)],
                      ),
                      borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF53f9ff).withOpacity(0.3),
                          blurRadius: isSmallScreen ? 4 : 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(icon, size: isSmallScreen ? 24 : 32, color: Colors.white),
                  ),
                  SizedBox(height: isSmallScreen ? 12 : 16),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: isSmallScreen ? 6 : 8),
                  Flexible(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                        color: Color(0xFF9ca3af),
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: isSmallScreen ? 3 : 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onTap) {
    return TextButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Text(
        text,
        style: TextStyle(color: Color(0xFF9ca3af)),
      ),
    );
  }

  void _scrollToFeatures() {
    _scrollController.animateTo(
      600,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
    );
    _scaleController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void handleRiotLogin() {
    setState(() => _isLoading = true);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: AlertDialog(
          backgroundColor: Color(0xFF1e2328),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFff4655), Color(0xFFe63946)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.security_rounded, color: Colors.white, size: 20),
              ),
              SizedBox(width: 12),
              Text('Riot Games Authentication', style: TextStyle(color: Colors.white)),
            ],
          ),
          content: Text(
            'RSO integration pending Riot Developer approval.\nDemo mode available for testing all features.',
            style: TextStyle(color: Color(0xFF9ca3af), height: 1.5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() => _isLoading = false);
                Navigator.pop(ctx);
              },
              child: Text('Cancel', style: TextStyle(color: Color(0xFF9ca3af))),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFff4655), Color(0xFFe63946)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Text('Demo Mode', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
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
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Hero(
                      tag: 'logo',
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFff4655), Color(0xFFe63946)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFff4655).withOpacity(0.3),
                              blurRadius: 20,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Text('🎯', style: TextStyle(fontSize: 40)),
                      ),
                    ),
                    SizedBox(height: 24),
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Color(0xFFff4655), Color(0xFF53f9ff)],
                      ).createShader(bounds),
                      child: Text(
                        'ValoSync',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Valorant Companion',
                      style: TextStyle(
                        color: Color(0xFF9ca3af),
                        fontSize: 16,
                      ),
                    ),
                    
                    SizedBox(height: 60),
                    
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF1e2328),
                            Color(0xFF252a30),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Color(0xFF53f9ff).withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
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
                          
                          Container(
                            width: double.infinity,
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFff4655), Color(0xFFe63946)],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFff4655).withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: _isLoading ? null : () {
                                  HapticFeedback.mediumImpact();
                                  handleRiotLogin();
                                },
                                child: Center(
                                  child: _isLoading 
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation(Colors.white),
                                        ),
                                      )
                                    : Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.security_rounded, color: Colors.white),
                                          SizedBox(width: 8),
                                          Text(
                                            'Continue with Riot',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
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
                          
                          Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF53f9ff), width: 2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  Navigator.pushNamed(context, '/dashboard');
                                },
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow_rounded, color: Color(0xFF53f9ff)),
                                      SizedBox(width: 8),
                                      Text(
                                        'Try Demo',
                                        style: TextStyle(
                                          color: Color(0xFF53f9ff),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 40),
                    
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFff4655).withOpacity(0.1),
                        border: Border.all(color: Color(0xFFff4655).withOpacity(0.3), width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.security_rounded, color: Color(0xFFff4655), size: 20),
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
                              height: 1.4,
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
            );
          },
        ),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  int currentTab = 0;
  late AnimationController _slideController;
  
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            HomeTab(),
            StatsTab(),
            StoreTab(),
            SocialTab(),
            SettingsTab(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Color(0xFF1e2328),
          child: SafeArea(
            top: false,
            child: TabBar(
              indicatorColor: Color(0xFFff4655),
              labelColor: Color(0xFFff4655),
              unselectedLabelColor: Color(0xFFFF6666),
              tabs: [
                Tab(icon: Icon(Icons.home_rounded, size: 20), text: 'Home'),
                Tab(icon: Icon(Icons.analytics_rounded, size: 20), text: 'Stats'),
                Tab(icon: Icon(Icons.storefront_rounded, size: 20), text: 'Store'),
                Tab(icon: Icon(Icons.people_rounded, size: 20), text: 'Social'),
                Tab(icon: Icon(Icons.settings_rounded, size: 20), text: 'Settings'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  late AnimationController _staggerController;

  @override
  void initState() {
    super.initState();
    _staggerController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );
    _staggerController.forward();
  }

  @override
  void dispose() {
    _staggerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        HapticFeedback.lightImpact();
        await Future.delayed(Duration(milliseconds: 800));
      },
      backgroundColor: Color(0xFF1e2328),
      color: Color(0xFFff4655),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            _buildStaggeredItem(
              0,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back!',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Your Valorant overview',
                              style: TextStyle(
                                color: Color(0xFF9ca3af),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF53f9ff), Color(0xFF4cc9f0)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF53f9ff).withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(Icons.person_rounded, color: Colors.white, size: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 32),
            
            // Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _buildStaggeredItem(1, ModernStatCard('Current Rank', 'Diamond 2', '+67 RR', Colors.amber)),
                _buildStaggeredItem(2, ModernStatCard('Combat Score', '245', '+12', Color(0xFF53f9ff))),
                _buildStaggeredItem(3, ModernStatCard('Win Rate', '67%', '+5%', Colors.green)),
                _buildStaggeredItem(4, ModernStatCard('Headshot %', '24%', '±0%', Color(0xFF888))),
              ],
            ),
            
            SizedBox(height: 32),
            
            // Recent Matches
            _buildStaggeredItem(
              5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Matches',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFff4655),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFF53f9ff).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFF53f9ff).withOpacity(0.3)),
                    ),
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF53f9ff),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 16),
            
            _buildStaggeredItem(6, ModernMatchCard('Sunset', '13-9', true, '24/15/8', 'Jett')),
            _buildStaggeredItem(7, ModernMatchCard('Bind', '11-13', false, '18/17/5', 'Sage')),
            _buildStaggeredItem(8, ModernMatchCard('Haven', '13-7', true, '31/12/6', 'Reyna')),
            
            SizedBox(height: 24),
            
            _buildStaggeredItem(
              9,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF53f9ff).withOpacity(0.1),
                      Color(0xFF4cc9f0).withOpacity(0.05),
                    ],
                  ),
                  border: Border.all(color: Color(0xFF53f9ff).withOpacity(0.3), width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF53f9ff).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.info_outline_rounded, color: Color(0xFF53f9ff), size: 20),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Demo Mode',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Real integration pending Riot API approval',
                            style: TextStyle(
                              color: Color(0xFF9ca3af),
                              fontSize: 12,
                            ),
                          ),
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
    );
  }

  Widget _buildStaggeredItem(int index, Widget child) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600 + (index * 100)),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
    );
  }
}

class ModernStatCard extends StatelessWidget {
  final String title, value, change;
  final Color color;
  
  const ModernStatCard(this.title, this.value, this.change, this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1e2328),
            Color(0xFF252a30),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF333).withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF9ca3af),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            change,
            style: TextStyle(
              color: Color(0xFF666),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ModernMatchCard extends StatelessWidget {
  final String map, score, kda, agent;
  final bool won;
  
  const ModernMatchCard(this.map, this.score, this.won, this.kda, this.agent);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1e2328),
            Color(0xFF252a30),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: won 
            ? Colors.green.withOpacity(0.3) 
            : Colors.red.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: (won ? Colors.green : Colors.red).withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: won 
                  ? [Colors.green, Colors.green.shade600]
                  : [Colors.red, Colors.red.shade600],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: (won ? Colors.green : Colors.red).withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                won ? 'W' : 'L',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  map,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  score,
                  style: TextStyle(
                    color: Color(0xFF9ca3af),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                kda,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Color(0xFF53f9ff).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  agent,
                  style: TextStyle(
                    color: Color(0xFF53f9ff),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
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

// Continue with other tabs (StatsTab, StoreTab, SocialTab, SettingsTab, etc.)
// For brevity, I'll show the key improvements for StatsTab and StoreTab

class StatsTab extends StatefulWidget {
  const StatsTab({Key? key}) : super(key: key);

  @override
  _StatsTabState createState() => _StatsTabState();
}

class _StatsTabState extends State<StatsTab> with TickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFFff4655), Color(0xFF53f9ff)],
            ).createShader(bounds),
            child: Text(
              'Performance Analytics',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 40),
          
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + (_pulseController.value * 0.02),
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF1e2328),
                        Color(0xFF252a30),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Color(0xFF53f9ff).withOpacity(0.3),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF53f9ff).withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF53f9ff), Color(0xFF4cc9f0)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF53f9ff).withOpacity(0.3),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(Icons.analytics_rounded, size: 48, color: Colors.white),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Detailed Statistics Coming Soon',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Advanced analytics including:\n• Agent performance breakdowns\n• Map-specific statistics\n• Aim accuracy trends\n• Rank progression predictions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF9ca3af),
                          height: 1.6,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class StoreTab extends StatefulWidget {
  const StoreTab({Key? key}) : super(key: key);

  @override
  _StoreTabState createState() => _StoreTabState();
}

class _StoreTabState extends State<StoreTab> with TickerProviderStateMixin {
  late AnimationController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Store',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFff4655),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF53f9ff), Color(0xFF4cc9f0)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF53f9ff).withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh_rounded, color: Colors.white, size: 16),
                    SizedBox(width: 6),
                    Text(
                      'Updates in 14h 23m',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: BouncingScrollPhysics(),
              children: [
                ModernStoreItem('Phantom', 'Ion', '1775 VP', true),
                ModernStoreItem('Vandal', 'Prime', '1775 VP', false),
                ModernStoreItem('Operator', 'Dragon', '2175 VP', false),
                ModernStoreItem('Sheriff', 'Reaver', '1775 VP', true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ModernStoreItem extends StatelessWidget {
  final String weapon, skin, price;
  final bool isWishlisted;
  
  const ModernStoreItem(this.weapon, this.skin, this.price, this.isWishlisted);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1e2328),
            Color(0xFF252a30),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isWishlisted ? Color(0xFFff4655) : Color(0xFF333).withOpacity(0.5), 
          width: isWishlisted ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isWishlisted 
              ? Color(0xFFff4655).withOpacity(0.2)
              : Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 64,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF53f9ff).withOpacity(0.2),
                      Color(0xFF4cc9f0).withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color(0xFF53f9ff).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Icon(Icons.sports_esports_rounded, color: Color(0xFF53f9ff), size: 24),
              ),
              if (isWishlisted)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFff4655), Color(0xFFe63946)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFff4655).withOpacity(0.3),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(Icons.favorite_rounded, color: Colors.white, size: 12),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            weapon,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            skin,
            style: TextStyle(
              color: Color(0xFF9ca3af),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFff4655), Color(0xFFe63946)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialTab extends StatelessWidget {
  const SocialTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFFff4655), Color(0xFF53f9ff)],
            ).createShader(bounds),
            child: Text(
              'Social Hub',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 40),
          
          Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1e2328),
                  Color(0xFF252a30),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Color(0xFF53f9ff).withOpacity(0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF53f9ff), Color(0xFF4cc9f0)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF53f9ff).withOpacity(0.3),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(Icons.people_rounded, size: 48, color: Colors.white),
                ),
                SizedBox(height: 24),
                Text(
                  'Team Building Features',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Coming soon:\n• Find compatible teammates\n• Team formation tools\n• Match result sharing\n• Community leaderboards',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF9ca3af),
                    height: 1.6,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFff4655), Color(0xFFe63946)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFff4655).withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => HapticFeedback.lightImpact(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Text(
                          'Join Beta',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
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

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

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
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFFff4655), Color(0xFF53f9ff)],
            ).createShader(bounds),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 32),
          
          _buildModernSettingsSection('Account', [
            _buildModernSettingsTile(
              Icons.person_rounded,
              'Profile',
              'Manage your profile information',
              () => HapticFeedback.lightImpact(),
            ),
            _buildModernSettingsTile(
              Icons.security_rounded,
              'Privacy',
              'Data and privacy settings',
              () {
                HapticFeedback.lightImpact();
                Navigator.pushNamed(context, '/privacy');
              },
            ),
          ]),
          
          _buildModernSettingsSection('Preferences', [
            _buildModernSwitchTile(
              Icons.dark_mode_rounded,
              'Dark Mode',
              'Use dark theme',
              darkMode,
              (value) {
                HapticFeedback.lightImpact();
                setState(() => darkMode = value);
              },
            ),
            _buildModernSwitchTile(
              Icons.notifications_rounded,
              'Notifications',
              'Push notifications',
              notifications,
              (value) {
                HapticFeedback.lightImpact();
                setState(() => notifications = value);
              },
            ),
            _buildModernSwitchTile(
              Icons.analytics_rounded,
              'Analytics',
              'Help improve ValoSync',
              analytics,
              (value) {
                HapticFeedback.lightImpact();
                setState(() => analytics = value);
              },
            ),
          ]),
          
          _buildModernSettingsSection('Support', [
            _buildModernSettingsTile(
              Icons.help_rounded,
              'Help Center',
              'Get help and support',
              () => HapticFeedback.lightImpact(),
            ),
            _buildModernSettingsTile(
              Icons.info_rounded,
              'About',
              'About ValoSync',
              () {
                HapticFeedback.lightImpact();
                Navigator.pushNamed(context, '/about');
              },
            ),
            _buildModernSettingsTile(
              Icons.description_rounded,
              'Terms',
              'Terms of Service',
              () {
                HapticFeedback.lightImpact();
                Navigator.pushNamed(context, '/terms');
              },
            ),
          ]),
          
          SizedBox(height: 32),
          
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red.withOpacity(0.5), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  HapticFeedback.mediumImpact();
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernSettingsSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4, bottom: 16),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFff4655),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1e2328),
                Color(0xFF252a30),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFF333).withOpacity(0.5), width: 1),
          ),
          child: Column(children: children),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildModernSettingsTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF53f9ff).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Color(0xFF53f9ff), size: 20),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Color(0xFF9ca3af),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: Color(0xFF666)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernSwitchTile(IconData icon, String title, String subtitle, bool value, Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF53f9ff).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Color(0xFF53f9ff), size: 20),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xFF9ca3af),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Color(0xFFff4655),
            activeTrackColor: Color(0xFFff4655).withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}

// Keep the existing AboutPage, PrivacyPolicyPage, and TermsPage classes as they were
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