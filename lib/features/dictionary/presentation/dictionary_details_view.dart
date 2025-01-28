import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/Custom_video_player.dart';

class DictionaryDetailsView extends StatelessWidget {
  final String videoId; // Video ID passed from the item

  const DictionaryDetailsView({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YouTubeVideoPlayer(videoId: videoId), // Pass the videoId
    );
  }
}
