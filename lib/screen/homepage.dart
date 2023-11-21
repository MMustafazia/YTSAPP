import 'package:flutter/material.dart';
import 'package:ytsapp/screen/search.dart';
import 'package:ytsapp/screen/tabsHomeScreen.dart/animetab.dart';
import 'package:ytsapp/screen/tabsHomeScreen.dart/movietab.dart';
import 'package:ytsapp/screen/tabsHomeScreen.dart/seasontab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Specify the number of tabs in the TabController
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'YTS',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(
                Icons.search,
                color: Colors.red,
              ))
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.red,
          labelStyle: TextStyle(
              color: Colors.grey.shade600, fontWeight: FontWeight.w400),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          indicatorColor: Colors.red,
          tabs: [
            Tab(text: 'Movie'),
            Tab(text: 'Season'),
            Tab(text: 'Anime'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MovieTab(),
          SeasonTab(),
          AnimeTab(),
        ],
      ),
    );
  }
}
