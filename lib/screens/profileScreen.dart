import 'package:flutter/material.dart';
import 'package:socio/widgets/customCarousel.dart';
import 'package:socio/widgets/customDrawer.dart';
import '../data/data.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController;
  void initState() {
    _pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              ClipPath(
                clipper: BgImgClipper(),
                child: Image.asset(
                  '${currentUser.backgroundImageUrl}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                ),
              ),
              Positioned(
                  top: 90,
                  left: 30,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  )),
              Positioned(
                bottom: 0,
                left: 50,
                right: 50,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          '${currentUser.profileImageUrl}',
                        ),
                      )),
                ),
              )
            ]),
            Column(
              children: [
                Text(
                  currentUser.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Following",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          currentUser.following.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Followers",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          currentUser.followers.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            CustomCarousel(
              pageController: _pageController,
              posts: currentUser.posts,
              title: "Your Posts",
            ),
            CustomCarousel(
              pageController: _pageController,
              posts: currentUser.favorites,
              title: "Favourite Posts",
            )
          ],
        ),
      ),
    );
  }
}

class BgImgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75);
    Offset centerPoint = Offset(size.width * 0.5, size.height);
    path.quadraticBezierTo(
        centerPoint.dx, centerPoint.dy, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
