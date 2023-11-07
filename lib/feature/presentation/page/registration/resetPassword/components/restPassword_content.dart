import 'package:flutter/material.dart';
import 'package:open_eye/feature/presentation/common/colors/colors.dart';
import 'package:open_eye/feature/presentation/common/form/form.dart';
import 'package:open_eye/feature/presentation/common/size_config/size_config.dart';
import 'package:open_eye/feature/presentation/page/registration/signin/signin.dart';
import 'package:open_eye/feature/presentation/widget/button/default_button.dart';
import 'package:open_eye/helper/helper.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cPass1 = TextEditingController();
  TextEditingController cPass2 = TextEditingController();
  bool? _isHidden = true;
  bool? _isHidden2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            obscureText: _isHidden!,
            controller: cPass1,
            validator: (value) {
              if (value!.isEmpty) {
                return kPassNullError;
              } else {
                if (value.length < 8) {
                  return kShortPassError;
                }
              }
            },
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  width: 1,
                  color: grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  width: 1,
                  color: grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  width: 1,
                  color: primaryColor,
                ),
              ),
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _isHidden! ?  Icons.visibility_off : Icons.visibility,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          TextFormField(
            obscureText: _isHidden2! ,
            controller: cPass2,
            validator: (value) {
              if (value!.isEmpty) {
                return kPassNullError;
              } else {
                if (cPass1.text != cPass2.text) {
                  return kMatchPassError;
                }
              }
            },
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  width: 1,
                  color: grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  width: 1,
                  color: grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  width: 1,
                  color: primaryColor,
                ),
              ),
              suffix: InkWell(
                onTap: _togglePasswordView2,
                child: Icon(
                  _isHidden2! ?  Icons.visibility_off : Icons.visibility,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  KeyboardUtil.hideKeyboard(context);
                  Navigator.pushNamed(context, SignInScreen.routeName);
                }
              }),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden!;
    });
  }
  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2!;
    });
  }
}
