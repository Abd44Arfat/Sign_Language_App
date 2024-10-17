import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/home_page/widgets/home_app_bar.dart';
import 'package:sign_lang_app/core/widgets/next_button.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({super.key});

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Replace with your video URL
    _controller = VideoPlayerController.network(
      'https://simax.media/wp-content/uploads/2019/04/SiMAX-The-sign-language-avatar.mp4?_=1',
    );

    // Initialize the controller and store the Future for later use
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
        
            CustomHomeAppBar(title: 'the sentence is :', subtitle: 'How are you'),
            SizedBox(height: 60,),
            FutureBuilder<void>(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                // Check for errors
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                   
                      child: AspectRatio(
                        aspectRatio: 380/400,
                        child: VideoPlayer(_controller),
                      ),
                    
                  );
                } else {
                 
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
               SizedBox(height: 60,),
          
          ],
        ),

      
      ),
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Colors.green,
        onPressed: (){


         
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),

     
    ));
  }
}

//  