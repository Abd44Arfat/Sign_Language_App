import 'dart:ui';
import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  final Widget child;
  final double? width;
  const CustomStack({super.key, required this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background gradient
        Container(
          width: width ?? double.minPositive,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black, // Bottom color
                Color(0xff2E2E2E), // Top color
              ],
            ),
          ),
        ),
        // Positioned elements
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                right: -100,
                child: Container(
                  height: 180,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 143, 222, 146)
                        .withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      height: 180,
                      width: 166,
                      color: const Color.fromARGB(0, 172, 255, 149),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Main content
        child,
      ],
    );
  }
}




/*Stack(
      children: [
        // Background gradient
        Container(
          width: width ?? double.minPositive,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                //Theme.of(context).colorScheme.onSecondary,
                Colors.black, // Bottom color
                //Colors.white
                Color(0xff2E2E2E), // Top color
              ],
            ),
          ),
        ),
        // Positioned elements
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                right: -100,
                child: Container(
                  height: 180,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 143, 222, 146)
                        .withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      height: 180,
                      width: 166,
                      color: const Color.fromARGB(0, 172, 255, 149),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Main content
        child,
      ],
    ); */