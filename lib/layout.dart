import 'package:flutter/material.dart';
import 'package:food_ui_design/screens/account_screen.dart';
import 'package:food_ui_design/screens/card_screen.dart';
import 'package:food_ui_design/screens/home_screen.dart';
import 'package:food_ui_design/screens/map_screen.dart';

class AppScreen extends StatefulWidget {
  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    int currentIndex = 0;
    List<Widget> screens = [
      HomeScreen(),
      MapScreen(),
      CardScreen(),
      AccountScreen(),
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: screens
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            labelPadding: const EdgeInsets.only(bottom: 10),
            labelStyle: const TextStyle(fontSize: 16.0),
            indicatorColor: Colors.transparent,
            labelColor: theme.primaryColor,
            unselectedLabelColor: Colors.black54,
            tabs: const [
              Tab(
                icon: Icon(Icons.home, size: 28),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.gps_not_fixed, size: 28),
                text: 'Map',
              ),
              Tab(
                icon: Icon(Icons.card_travel, size: 28),
                text: 'Card',
              ),
              Tab(
                icon: Icon(Icons.person_outline, size: 28),
                text: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
