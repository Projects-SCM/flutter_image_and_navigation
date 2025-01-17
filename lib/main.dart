// we will add navigation mapping to the root
// so let's go ahead and import home_screen and image_screen as well
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/image_screen.dart';

void main(){
  runApp(const MyApp()); // we will define MyApp in a bit. But before that note, the compiler does not complain if 
  // I remove the "const" from within runApp(). That's because there are apps where we cannot know all the parameters
  // of MyApp constructor during compile time. However, in this case, our MyApp() is not taking in any parameter
  //arguments at all. So we should put the const back in to help with compile time optimization.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image and Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //normally now this is here we set our HomeScreenPage() or the COntentView equivalent
      // but in this example, we will define the nivigation layout or mapping.
      // this is not necessary to use Navigator, but useful nonetheless
      //Also, Flutter uses Routing and Navigator for navigation
      initialRoute: '/', //this names or maps the initial screen to '/'
      routes: {
        '/' : (context) => HomeScreen(), // this code is roughly saying, use this string '/' to be the name of the context 
        // that is the HomeScreen(). the ":" is mapping the string to the function defined by: (context) => HomeScreen()
        '/images' : (context) => ImageScreen(), // here the string '/images' is being mapped to ImageScreen()
      },
    );
  }
}
// you are seeing the red lines becase we have not defined HomeScreen or ImageScreem yet. Let's put some
// quick code in and then come back here to understand the route syntax.


//Let's now switch gears and focus on Git and GitHub
// In VSCode there is a Source Contel Panel on the left
// Since we did not initilize Git yet for this project, let's go ahead and do so
// I canceled the commit, because commits usually fail without commit messages.