import 'package:flutter/material.dart';
import 'package:majootestcase/common/widget/text_form_field.dart';

class InputPasswordView extends StatefulWidget {
  InputPasswordView({Key? key, this.controller}) : super(key: key);
  TextController? controller;

  @override
  State<InputPasswordView> createState() => _InputPasswordViewState();
}

class _InputPasswordViewState extends State<InputPasswordView> {
  bool _isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: 'Password',
      hint: 'password',
      controller: widget.controller,
      isObscureText: _isObscurePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _isObscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
        onPressed: () {
          setState(() {
            _isObscurePassword = !_isObscurePassword;
          });
        },
      ),
    );
  }
}
