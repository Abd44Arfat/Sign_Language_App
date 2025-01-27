import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/Custom_video_player.dart';

class DictionaryDetailsView extends StatelessWidget {
  const DictionaryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: YouTubeVideoPlayer(videoId: '',),
    );
  }
}
