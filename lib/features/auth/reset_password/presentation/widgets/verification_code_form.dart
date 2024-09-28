import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/features/auth/reset_password/manager/verification_cubit/verification_cubit.dart';
import 'package:sign_lang_app/features/auth/reset_password/manager/verification_cubit/verification_state.dart';

import '../../../../../core/routing/routes.dart';

class VerificationCodeForm extends StatefulWidget {
  const VerificationCodeForm({super.key});

  @override
  State<VerificationCodeForm> createState() => _VerificationCodeFormState();
}

class _VerificationCodeFormState extends State<VerificationCodeForm> {
  // Create focus nodes for each TextFormField
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  // Controllers for each input field
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit, VerificationState>(
      listener: (context, state) {
        List<bool> emptyFields = (state is VerificationFormInvalid)
            ? state.emptyFields
            : [false, false, false, false];
        if (state is VerificationFormValid) {
          Navigator.pushNamed(context, Routes.createNewPassword);
        }
        else if(state is VerificationFormInvalid){

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('the code ca\'t be empty')),
          );
        }
        else if (state is VerificationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
          key: widget.key,
          child: Row(
            children: [
              _buildVerificationTextField(
                  _controller1, _focusNode1, _focusNode2),
              SizedBox(width: 10),
              _buildVerificationTextField(
                  _controller2, _focusNode2, _focusNode3),
              SizedBox(width: 10),
              _buildVerificationTextField(
                  _controller3, _focusNode3, _focusNode4),
              SizedBox(width: 10),
              _buildVerificationTextField(_controller4, _focusNode4, null),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each TextFormField
  Widget _buildVerificationTextField(TextEditingController controller,
      FocusNode currentFocus, FocusNode? nextFocus) {
    return SizedBox(
      width: 70,
      child: TextFormField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          counterText: "", // hide counter
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: ColorsManager.mediumLightBlue),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
