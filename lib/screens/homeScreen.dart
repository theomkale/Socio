import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socio/widgets/customCarousel.dart';
import 'package:socio/widgets/customDrawer.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(viewportFraction: 0.80);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          "SOCIO",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        bottom: TabBar(
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          indicatorWeight: 5,
          controller: _tabController,
          tabs: [
            Tab(
              text: "Trending",
            ),
            Tab(
              text: "Latest",
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Following",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    itemBuilder: (c, i) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 3),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  "${users[i].profileImageUrl}",
                                ),
                                fit: BoxFit.cover)),
                      );
                    })),
            SizedBox(
              height: 10,
            ),
            CustomCarousel(
              pageController: _pageController,
              title: "Posts",
              posts: posts,
            )
          ],
        ),
      ),
    );
  }
}
