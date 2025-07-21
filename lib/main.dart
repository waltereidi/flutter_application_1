import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/bookList.dart';
import 'package:flutter_application_1/views/bookNotes.dart';
import 'package:flutter_application_1/views/bookStatistics.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.book),
            icon: Icon(Icons.home_outlined),
            label: 'Books',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.assessment)),
            label: 'Statistics',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.auto_stories)),
            label: 'Notes',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        BookList(),
        Bookstatistics(),
        BookNotes(),

        /// Notifications page

        /// Messages page
      ][currentPageIndex],
    );
  }
}
