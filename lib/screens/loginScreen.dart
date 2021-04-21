import 'package:flutter/material.dart';
import 'package:socio/screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ClipPath(
                clipper: ImgClipper(),
                child: Image.asset('assets/images/login_background.jpg',
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    fit: BoxFit.cover),
              ),
              Text(
                "Socio",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "User Name",
                        prefixIcon: Icon(
                          Icons.account_box,
                          size: 30,
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 30,
                        ))),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (c) => HomeScreen()));
                },
                child: Container(
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 70),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text("Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                color: Theme.of(context).primaryColor,
                height: 80,
                child: Text(
                  "Dont have an account? Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//custom clipper to make curved image
class ImgClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75);
    Offset center = Offset(size.width * 0.5, size.height * 0.75);
    Offset p1 = Offset(size.width * 0.25, size.height);
    Offset p2 = Offset(size.width * 0.75, size.height * 0.50);
    path.quadraticBezierTo(p1.dx, p1.dy, center.dx, center.dy);
    path.quadraticBezierTo(p2.dx, p2.dy, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
