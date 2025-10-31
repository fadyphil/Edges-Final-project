// lib/presentation/shell/app_shell.dart
import 'package:flutter/material.dart';
import 'package:trip_planner/core/presentaion/screens/favorite_destinations_screen.dart';
import 'package:trip_planner/core/presentaion/screens/my_trip_screen.dart';
import 'package:trip_planner/core/presentaion/screens/profile_screen.dart';
import 'package:trip_planner/features/destination/presentation/screens/explore_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  // Controller to manage the pages in the PageView
  late final PageController _pageController;
  // Variable to track the currently selected tab index
  int _currentIndex = 0;

  // List of the main screens for our navigation
  final List<Widget> _screens = [
    ExploreScreen(),
    const MyTripsScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // This function is called when a tab is tapped
  void _onTabTapped(int index) {
    // Animate the PageView to the new page
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  // This function is called when the user swipes the PageView
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body is a PageView, which allows for swiping between screens.
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),

      // The BottomNavigationBar is our main navigation component.
      bottomNavigationBar: BottomNavigationBar(
        // Use the current index to highlight the active tab
        currentIndex: _currentIndex,
        onTap: _onTabTapped,

        // --- STYLING (from your AppTheme) ---
        // These colors will be automatically picked up from your FlexColorScheme setup.
        // No need to set them manually if your theme is configured correctly.
        // selectedItemColor: Theme.of(context).colorScheme.secondary,
        // unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Good for 3-4 items
        showUnselectedLabels: true,

        // Define the items for the navigation bar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            activeIcon: Icon(Icons.card_travel),
            label: 'My Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
