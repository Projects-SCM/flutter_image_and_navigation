// This file will handle the two images: 1 from assets or images folder
// and one from url

// begin with material
import 'package:flutter/material.dart'; 
import '../styles/app_styles.dart'; 
import 'dart:async';


//lets begin by loading the asset image first
//and then we will work on the url image
class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  Future<String> fetchImageUrl() async{
    await Future.delayed(Duration(seconds:2)); // this code is here to simulate a network delay
    // so that we can see the progress circle swilring. You should not put this code in your production app
    // only for testing
    
    //copy and paste the url here
    return 'https://static.wikia.nocookie.net/avatar/images/2/25/Aang_in_the_iceberg.png/revision/latest?cb=20140102123223';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Screen')
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //Display image from Asset
              Text(
                'Image from Assest:',
                style: AppStyles.titleStyle,
              ),

              Text(
                'Image: Random Image, From: Usplash', // the avatar image will be the one from URL
                style: AppStyles.subtitleStyle,
              ),

              //Add some space
              const SizedBox(height: 10),

              //Add/load image from asset here
              Image(
                image: AssetImage('images/sample.jpg'),
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),

              //Add some space
              const SizedBox(height: 20),

              //Display image from URL
              Text(
                'Image from URL',
                style: AppStyles.titleStyle, //if you want you can add additional formating still but I am going
                // to go with the style we set earlier in AppStyles
              ),

              Text(
                'Image: Last Airbender Show, From: AvatarWiki', // the avatar image will be the one from URL
                style: AppStyles.subtitleStyle,
              ),

              //Add some space
              const SizedBox(height: 10),

              // here we will now need to write code for reading the url
              // lets write a helper "function" or closure with that

              FutureBuilder<String>(
                future: fetchImageUrl(), // this is the task that will happen in the future
                builder: (context, snapshot){
                  // put your error checking code here.
                  if(snapshot.connectionState == ConnectionState.waiting){// if waiting for data
                    return Center(
                      child: CircularProgressIndicator(), // show the progress indicator
                    );
                  } else if (snapshot.hasError){ // if there is an error
                    return Text(
                      'Error loading image',
                      style: AppStyles.subtitleStyle.copyWith(color: Colors.red), // say there is an error
                    );
                  } else if (snapshot.hasData){//if you are able get some data from the url
                    return Image.network(
                      snapshot.data!, // we are force unwrapping because we already checked that there is data
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    );
                  } else { // unknown reasons, likely due to server side error
                    return Text(
                      'No image found',
                      style: AppStyles.subtitleStyle.copyWith(color: Colors.red),
                    );
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}