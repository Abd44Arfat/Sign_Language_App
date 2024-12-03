import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';

class CustomSettingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomSettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 100, // Set the height of the AppBar
      title: FutureBuilder<Map<String, String?>>(
        future: _getUserInfo(), // Fetch user info
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final userInfo = snapshot.data ??
                {'username': 'User', 'email': 'user@example.com'};
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue[200],
                radius: 30,
                child: Text(
                  userInfo['username']?.substring(0, 2).toUpperCase() ??
                      "AA", // Use initials
                  style: TextStyles.font20BlackExtraBold,
                ),
              ),
              title: Text(
                userInfo['username'] ?? 'User', // Main title
                style: TextStyles.font16Blackbold
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              subtitle: Text(
                userInfo['email'] ?? 'user@example.com', // Subtitle
                style: TextStyles.font15BlackMedium
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            );
          }
        },
      ),
    );
  }

  Future<Map<String, String?>> _getUserInfo() async {
    final username =
        await SharedPrefHelper.getStringNullable(SharedPrefKeys.username);
    final email =
        await SharedPrefHelper.getStringNullable(SharedPrefKeys.userEmail);
    return {
      'username': username,
      'email': email,
    };
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(100); // Provide the preferred size here
}
