import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_app/core/resources/color_manager.dart';
import 'package:pets_app/core/resources/font_manager.dart';
import 'package:pets_app/core/routes/routes.dart';
import 'package:pets_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:pets_app/core/shared/widgets/deafult_text_field.dart';
import 'package:pets_app/core/utils/helpers/helper_functons.dart';
import 'package:pets_app/core/utils/helpers/validation_helper.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confrimPasswordController = TextEditingController();
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) {
        FocusManager.instance.primaryFocus!.unfocus();
      }
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confrimPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100.h),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Update Your Password',
                    style: HelperFunction.textTheme(context).headlineLarge,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Image.asset(
                    'assets/images/updatePassword.png',
                    width: 324.w,
                    height: 324.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'New Password',
                    isPassword: true,
                    textEditingController: _passwordController,
                    validator: (password) =>
                        ValidationHelper.isValidPassword(password),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'Confrim password',
                    textEditingController: _confrimPasswordController,
                    isPassword: true,
                    validator: (confirmPassword) =>
                        ValidationHelper.isValidConfirmPassword(
                      confirmPassword,
                      _confrimPasswordController,
                    ),
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
