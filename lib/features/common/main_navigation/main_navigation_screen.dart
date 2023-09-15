import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/activity/activity_screen.dart';
import 'package:twitter_challenge/features/home/home_screen.dart';
import 'package:twitter_challenge/features/post/post_screen.dart';
import 'package:twitter_challenge/features/search/search_screen.dart';
import 'package:twitter_challenge/features/users/screens/privacy_screen.dart';
import 'package:twitter_challenge/features/users/screens/user_profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key, required this.tab});

  static const routeName = 'home';
  static const routeUrl = '/';

  final String tab;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen>
    with TickerProviderStateMixin {
  bool _onPost = false;
  String _text = '';
  XFile? _newImage;

  final List<String> _tabs = [
    "",
    "search",
    "xxxx",
    "activity",
    "profile",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  late final AnimationController _progressController = AnimationController(
    vsync: this,
    duration: const Duration(minutes: 1),
  );

  late final AnimationController _marqueeController = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 20,
    ),
  );

  late final AnimationController _menuController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
    reverseDuration: const Duration(seconds: 1),
  );

  final Curve _menuCurve = Curves.easeInOutCubic;

  late final Animation<double> _screenScale = Tween(
    begin: 1.0,
    end: 0.7,
  ).animate(
    CurvedAnimation(
      parent: _menuController,
      curve: Interval(
        0.0,
        0.3,
        curve: _menuCurve,
      ),
    ),
  );

  late final Animation<Offset> _screenOffset = Tween(
    begin: Offset.zero,
    end: const Offset(0.5, 0),
  ).animate(
    CurvedAnimation(
      parent: _menuController,
      curve: Interval(
        0.1,
        0.4,
        curve: _menuCurve,
      ),
    ),
  );

  late final Animation<double> _closeButtonOpacity = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _menuController,
      curve: Interval(
        0.3,
        0.5,
        curve: _menuCurve,
      ),
    ),
  );

  late final List<Animation<Offset>> _menuAnimations = [
    for (var i = 0; i < _menus.length; i++)
      Tween<Offset>(
        begin: const Offset(
          kIsWeb ? 0.0 : -1,
          0,
        ),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _menuController,
          curve: Interval(
            0.2 + (0.1 * 1),
            0.4 + (0.1 * i),
            curve: _menuCurve,
          ),
        ),
      ),
  ];

  late final Animation<Offset> _logOutSlide = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _menuController,
      curve: Interval(
        0.8,
        1.0,
        curve: _menuCurve,
      ),
    ),
  );

  @override
  void dispose() {
    _progressController.dispose();
    _marqueeController.dispose();
    _menuController.dispose();
    super.dispose();
  }

  late final size = MediaQuery.of(context).size;

  void _openMenu() {
    if (kIsWeb) return;
    _menuController.forward();
  }

  void _closeMenu() {
    if (kIsWeb) return;
    _menuController.reverse();
  }

  final List<Map<String, dynamic>> _menus = [
    {
      "icon": Icons.person_add_outlined,
      "text": "Follow and invite friends",
    },
    {
      "icon": Icons.notifications_none_rounded,
      "text": "Notifications",
    },
    {
      "icon": Icons.lock_outline_rounded,
      "text": "Privacy",
    },
    {
      "icon": Icons.account_circle_outlined,
      "text": "Account",
    },
    {
      "icon": Icons.help_outline_sharp,
      "text": "Help",
    },
    {
      "icon": Icons.info_outline_rounded,
      "text": "About",
    },
  ];

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onModalPost() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
    ));
    _onPost = true;
    setState(() {});
    _onBottomSheet();
    _onPost = false;
    setState(() {});
  }

  void _onBottomSheet() async {
    final result = await showModalBottomSheet(
      showDragHandle: false,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const PostScreen(
        userId: "스와이프",
      ),
      transitionAnimationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
        reverseDuration: const Duration(milliseconds: 600),
      ),
    );
    print(result);
    if (result != null) {
      _text = result[0];
      _onPost = true;
      _newImage = result[1];
      setState(() {});
    }
  }

  void _onNextTap() {
    context.goNamed(PrivacyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.width);
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.grey,
              leading: FadeTransition(
                opacity: _closeButtonOpacity,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _closeMenu,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  for (var i = 0; i < _menus.length; i++) ...[
                    SlideTransition(
                      position: _menuAnimations[i],
                      child: GestureDetector(
                        onTap: i == 2 ? _onNextTap : null,
                        child: Row(
                          children: [
                            Icon(
                              _menus[i]["icon"],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              _menus[i]["text"],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                  SlideTransition(
                    position: _logOutSlide,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Log out",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          SlideTransition(
            position: _screenOffset,
            child: ScaleTransition(
              scale: _screenScale,
              child: Center(
                child: SizedBox(
                  width: kIsWeb ? size.width / 3 : size.width,
                  child: Scaffold(
                    body: Stack(
                      children: [
                        Offstage(
                          offstage: _selectedIndex != 0,
                          child: HomeScreen(
                            text: _text,
                            addPost: _onPost,
                            newImage: _newImage,
                          ),
                        ),
                        Offstage(
                          offstage: _selectedIndex != 1,
                          child: SearchScreen(),
                        ),
                        Offstage(
                          offstage: _selectedIndex != 3,
                          child: ActivityScreen(),
                        ),
                        Offstage(
                          offstage: _selectedIndex != 4,
                          child: UserProfileScreen(menu: _openMenu),
                        )
                      ],
                    ),
                    bottomNavigationBar: NavigationBar(
                      backgroundColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      height: Sizes.size52,
                      animationDuration: const Duration(milliseconds: 600),
                      labelBehavior:
                          NavigationDestinationLabelBehavior.alwaysHide,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (index) => _onTap(index),
                      elevation: 0,
                      destinations: [
                        NavigationDestination(
                          selectedIcon: const FaIcon(
                            FontAwesomeIcons.house,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.house,
                            color: Colors.grey.withOpacity(0.4),
                            size: Sizes.size24,
                          ),
                          label: 'Home',
                        ),
                        NavigationDestination(
                          selectedIcon: const FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          label: 'Search',
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: _onModalPost,
                            child: FaIcon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                        ),
                        NavigationDestination(
                          selectedIcon: const FaIcon(
                            FontAwesomeIcons.solidHeart,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.heart,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          label: 'likes',
                        ),
                        NavigationDestination(
                          selectedIcon: const FaIcon(
                            FontAwesomeIcons.solidUser,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.user,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          label: 'profile',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
