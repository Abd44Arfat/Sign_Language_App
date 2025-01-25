import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: CustomStack(child: SettingViewBody()),
    );
  }
}
