import 'package:flutter/material.dart';
import 'package:majootestcase/common/widget/text_form_field.dart';

class InputEmailView extends StatelessWidget {
  InputEmailView({
    Key? key,
    this.controller,
  }) : super(key: key);

  TextController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      isEmail: true,
      hint: 'Example@123.com',
      label: 'Email',
      validator: (val) {
        final pattern = new RegExp(r'([\d\w]{1,}@[\w\d]{1,}\.[\w]{1,})');
        if (val != null)
          return pattern.hasMatch(val) ? null : 'email is invalid';
      },
    );
  }
}
