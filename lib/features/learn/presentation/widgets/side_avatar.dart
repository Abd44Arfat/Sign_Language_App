import 'package:flutter/material.dart';

class SideAvatar extends StatefulWidget {
  const SideAvatar(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth, screenHeight; // 440  // 956

  @override
  State<SideAvatar> createState() => _SideAvatarState();
}

class _SideAvatarState extends State<SideAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0), // Start from the left outside the screen
      end: const Offset(0, 0), // End at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            top: -33,
            left: -170,
            child: SlideTransition(
              position: _slideAnimation,
              child: Transform.rotate(
                angle: 0.7,
                //alignment: Alignment.topLeft,
                //transform:  Matrix4 .rotationZ(
                //2.9 / 4,
                //),
                child: Image.asset(
                  "assets/images/avatar.png",
                  width: widget.screenWidth * 0.90,
                  height: widget.screenHeight * 0.44,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
