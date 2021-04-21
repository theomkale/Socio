import 'package:flutter/material.dart';
import 'package:socio/screens/homeScreen.dart';
import 'package:socio/screens/loginScreen.dart';
import 'package:socio/screens/profileScreen.dart';
import '../data/data.dart';

class CustomDrawer extends StatelessWidget {
  _drawerOption(Icon icon, String title, Widget route, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => route));
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/user_background.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  left: 10,
                  bottom: 20,
                  right: 200,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 3),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage("${currentUser.profileImageUrl}"))),
                  )),
              Positioned(
                  left: 100,
                  bottom: 20,
                  right: 20,
                  child: Text(
                    currentUser.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          _drawerOption(Icon(Icons.home), "Home", HomeScreen(), context),
          _drawerOption(
              Icon(Icons.settings), "Settings", HomeScreen(), context),
          _drawerOption(Icon(Icons.chat), "Chats", HomeScreen(), context),
          _drawerOption(Icon(Icons.map), "Map", HomeScreen(), context),
          _drawerOption(
              Icon(Icons.person), "Your Profile", ProfileScreen(), context),
          Spacer(),
          _drawerOption(Icon(Icons.logout), "Logout", LoginScreen(), context),
        ],
      ),
    );
  }
}
