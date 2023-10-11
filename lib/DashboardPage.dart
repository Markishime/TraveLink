import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travelink/main.dart';



class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Color(0xFF002B4A),
          title: Center(
            child: Text(
              "TRAVELINK",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "CustomFont",
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification bell action
              },
            ),
            // Add more action items as needed
          ],
        ),
      ),

      body: Container(
        color: Color(0xFF002B4A),
        child: Column(
          children: [
            SizedBox(height: 20), // Add some spacing
            Center(
              child: CarouselSlider(
                items: [
                  // You can add images or other widgets here
                  Image.asset(
                    'assets/blue_image.png', // Replace with your image asset path
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain, // Adjust image fit as needed
                  ),
                  Image.asset(
                    'assets/red_image.png', // Replace with your image asset path
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain, // Adjust image fit as needed
                  ),
                  // Add more images as needed
                ],
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
              ),
            ),
            SizedBox(height: 20), // Add some spacing
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Near You",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Mark Lloyd Cuizon"),
              accountEmail: Text("marklloydcuizon@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "AB",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                // Handle home menu item
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Profile"),
              onTap: () {
                // Handle profile menu item
              },
            ),
            Divider(), // Add a divider between main items and settings
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                // Handle settings menu item
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()), // Replace 'LoginPage' with the actual login page widget
                      (Route<dynamic> route) => false, // Remove all routes from the stack
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
