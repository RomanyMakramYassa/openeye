import 'package:flutter/material.dart';
import 'package:open_eye/feature/presentation/page/registration/resetPassword/components/body.dart';

class ResetPasswordScreen extends StatelessWidget {
  static String routeName = "/rest_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyResetPassword(),
    );
  }
}