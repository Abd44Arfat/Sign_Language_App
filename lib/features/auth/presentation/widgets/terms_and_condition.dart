import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
                    text: 'I’m agree to The ',
                    style: TextStyles.font16WhiteMedium.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Tarms of Service',
                    style: TextStyles.font16WhiteMedium.copyWith(
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyles.font16WhiteMedium,
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyles.font16WhiteMedium.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy ',
                    style: TextStyles.font16WhiteMedium.copyWith(
                      color: ColorsManager.primaryColor,
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
