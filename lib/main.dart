import 'package:flutter/material.dart';
import 'package:travelink/DashboardPage.dart';

import 'RegistrationPage.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRAVELINK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/travel_background.jpg', // Add your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Color(0xFF002B4A), // Background color
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'TRAVELINK',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300, // Set the width of the container
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8), // Background color for the container
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              String username = _usernameController.text;
                              String password = _passwordController.text;
                              // Perform login validation here
                              if (username == 'admin' && password == 'linkage') {
                                // Navigate to the home page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => DashboardPage()),
                                );
                              } else {
                                // Show an error message
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text('Invalid username or password.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text('Login'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle "Forgot Password?" press
                            },
                            child: Text('Forgot Password?'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Or sign in with:'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset('assets/facebook_logo.png'), // Facebook logo
                          onPressed: () {
                            // Handle Facebook login
                          },
                        ),
                        IconButton(
                          icon: Image.asset('assets/google_logo.png'), // Google logo
                          onPressed: () {
                            // Handle Google login
                          },
                        ),
                        IconButton(
                          icon: Image.asset('assets/linkedin_logo.png'), // LinkedIn logo
                          onPressed: () {
                            // Handle LinkedIn login
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        // Navigate to the RegistrationPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrationPage()),
                        );
                      },
                      child: Text('Don\'t have an account? Sign Up'),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
