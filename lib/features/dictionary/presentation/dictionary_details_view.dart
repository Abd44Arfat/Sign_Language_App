import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/Custom_video_player.dart';

class DictionaryDetailsView extends StatelessWidget {
  final String videoId; // Video ID passed from the item
  final String title; // Title passed from the item

  const DictionaryDetailsView({
    super.key,
    required this.videoId,
    required this.title, // Add title parameter
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(title,style: TextStyles.font20WhiteSemiBold.copyWith(color: Theme.of(context).colorScheme.onPrimary), // Display the title in the AppBar
      ), 
      ),
      body: YouTubeVideoPlayer(videoId: videoId), // Pass the videoId
    );
  }
}