// This file will contain the home screen

// begin with material
import 'package:flutter/material.dart'; 

//Let's now add a button to the HomeScreen, such that when user clicks the button
// the user is taken to the ImageScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen')
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/images'); // since we named the Image Screen, we are using the
            // pushedName method. This code is saying, 'brinh up the context that is named '/iamges''
          }, 
          child: Text('Go to Image Screen') // the text that appears on the button
        ),
      ),
    );
  }
}