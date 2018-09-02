import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_community_challenges/about.dart';
import 'package:flutter_community_challenges/challengeSuggestions.dart';
import 'package:flutter_community_challenges/hallOfFame.dart';
import 'package:flutter_community_challenges/upcomingChallenges.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:flutter_community_challenges/current_challenge.dart';
import 'pager_page.dart';

class MainViews extends StatefulWidget {
  MainViews({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainViewsState createState() => _MainViewsState();
}

class _MainViewsState extends State<MainViews> {
  PageController _pageController;

  // Navigate pages based on bottom navigation bar item tap
  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  int _page = 2; // Track which page is in view

  // handles when the page changes
  void _onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<PagerPage> _pages = <PagerPage>[
      About(),
      HallOfFame(),
      CurrentChallenge(),
      UpcomingChallenges(),
      ChallengeSuggestions(),
    ];

    // List of FloatingActionButtons to show only on 'Suggestions' page
    List<Widget> _fabs = _pages
        .map<Widget>((PagerPage page) => page.fabBuilder(context))
        .toList();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Theme.of(context).brightness,
      statusBarColor: Theme.of(context).primaryColor,
      systemNavigationBarColor: Theme.of(context).primaryColor,
      systemNavigationBarIconBrightness: Theme.of(context).brightness,
    ));

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Test Person"),
              accountEmail: Text("testperson@test.com"),
              currentAccountPicture: const CircleAvatar(),
            ),
            ListTile(
              title: Text("My Submissions"),
              trailing: Icon(GroovinMaterialIcons.account_circle),
              onTap: () {},
            ),
            ListTile(
              title: Text("App Settings"),
              trailing: Icon(GroovinMaterialIcons.settings_outline),
              onTap: () {},
            ),
            ListTile(
              title: Text("Log Out"),
              trailing: Icon(GroovinMaterialIcons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (_, isScrolled) => [
              SliverAppBar(
                title: Text(widget.title),
                centerTitle: true,
                snap: true,
                floating: true,
              ),
            ],
        body: PageView(
          onPageChanged: _onPageChanged,
          controller: _pageController,
          children: _pages,
        ),
      ),
      floatingActionButton: _fabs[_page],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItemsBuilder(context),
        currentIndex: _page,
        onTap: navigationTapped,
      ),
    );
  }

  // List of bottom navigation bar items
  List<BottomNavigationBarItem> _bottomNavigationBarItemsBuilder(context) => [
        BottomNavigationBarItem(
            icon: Icon(GroovinMaterialIcons.information_outline),
            title: Text("About"),
            backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(
            icon: Icon(GroovinMaterialIcons.crown),
            title: Text("Hall of Fame"),
            backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(
            icon: Icon(GroovinMaterialIcons.code_tags),
            title: Text("Current"),
            backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(
            icon: Icon(GroovinMaterialIcons.calendar_text),
            title: Text("Upcoming"),
            backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(
            icon: Icon(GroovinMaterialIcons.comment_plus_outline),
            title: Text("Suggestions"),
            backgroundColor: Theme.of(context).primaryColor),
      ];
}
