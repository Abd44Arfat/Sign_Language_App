import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: MediaQuery.sizeOf(context).height / 2.2,
          padding: EdgeInsets.all(17),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              LayoutBuilder(builder: (context, constraint) {
                return Stack(
                    children: [
                      Center(
                        child: ImageIcon(
                          AssetImage(
                            'assets/icons/success.png',
                          ),
                          size: 130,
                          color: Colors.green,
                        ),
                      ),
                      Positioned(
                          top: 38,
                          //constraint.minHeight/5,
                          right: constraint.maxWidth /2.3,
                          child: const ImageIcon(
                            AssetImage('assets/icons/true.png'),
                            size: 50,
                            color: Colors.white,
                          ))]);

              }),

              SizedBox(height: 20),
              Text(
                  textAlign: TextAlign.center,
                  'Password Update Successfully',
                  style: TextStyles.font24BlackBold
              ),
              SizedBox(height: 10),
              Text(
                'Password changed successfully, you can login again with new password',
                textAlign: TextAlign.center,
                style: TextStyles.font12GrayRegular.copyWith(fontSize: 17),
              ),
              Expanded(child: SizedBox(height: 20)),
              AppTextButton(
                buttonText: 'Back to Home',
                onPressed: () {
                  ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
                  Navigator.pushReplacementNamed(context, Routes.homescreen);
                }, textStyle: TextStyles.font20MediumLightBlueRegular.copyWith(color: Colors.white, fontSize: 23 ,fontWeight: FontWeight.w800),


              ),
              SizedBox(height: 20,)
            ],
          ),
        ));
  }
}
