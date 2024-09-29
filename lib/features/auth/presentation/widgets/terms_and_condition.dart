import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/auth/presentation/widgets/custom_check_box.dart';


class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By creating an account you agree',
                  style: TextStyles.font14BlackMedium.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'to our ',
                  style: TextStyles.font14BlackMedium.copyWith(
                    color: Colors.black,
                  ),
                ),
                 TextSpan(
                  text: ' ',
                  style: TextStyles.font14BlackMedium,
                ),
                TextSpan(
                  text: 'terms and conditions.',
                  style: TextStyles.font14BlackMedium.copyWith(
                    color: Colors.amber,
                  ),
                ),
                 TextSpan(
                  text: ' ',
                  style: TextStyles.font14BlackMedium,
                ),
                TextSpan(
                  text: 'بنا',
                  style: TextStyles.font14BlackMedium
                      .copyWith(color: Colors.amberAccent),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}