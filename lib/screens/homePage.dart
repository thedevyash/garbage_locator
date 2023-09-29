import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garbage_locator/Onboarding/onBoardingScreen.dart';
import 'package:garbage_locator/util/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapper(int page) {
    _pageController.jumpToPage(page);
  }

  void onPagechange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ],
          title: Text(
            "Clean VIT",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          )),
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Text("Version 1.0.0"),
              TextButton(onPressed: () {}, child: Text("Github")),
              TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => OnbordingScreen(),
                    ));
                  },
                  child: Text("LogOut"))
            ],
          ),
        ),
      ),
      body: PageView(
          controller: _pageController,
          onPageChanged: onPagechange,
          physics: const NeverScrollableScrollPhysics(),
          children: homeScreenItems),
      bottomNavigationBar: CupertinoTabBar(
          onTap: navigationTapper,
          backgroundColor: Colors.black,
          activeColor: Colors.white,
          currentIndex: _page,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.reviews_sharp), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bolt), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ]),
    );
  }
}
