import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_app/core/resources/color_manager.dart';
import 'package:pets_app/core/routes/routes.dart';
import 'package:pets_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:pets_app/core/shared/widgets/deafult_text_field.dart';
import 'package:pets_app/core/utils/helpers/helper_functons.dart';
import 'package:pets_app/core/utils/helpers/validation_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confrimPasswordController =
      TextEditingController();
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
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confrimPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 96.h),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Create Account',
                    style: HelperFunction.textTheme(context).headlineLarge,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Get Started',
                    style: HelperFunction.textTheme(context)
                        .headlineLarge!
                        .copyWith(
                          color: ColorManager.black,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'Username',
                    textEditingController: _userNameController,
                    textCapitalization: TextCapitalization.words,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'Email',
                    textEditingController: _emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (email) => ValidationHelper.isValidEmail(email),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'phone',
                    textEditingController: _phoneController,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'Password',
                    isPassword: true,
                    textEditingController: _passwordController,
                    validator: (password) =>
                        ValidationHelper.isValidPassword(password),
                  ),
                  SizedBox(
                    height: 27.h,
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
                    child: const Text('Sign Up'),
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                    child: Text(
                      'Already have an account',
                      style: HelperFunction.textTheme(context)
                          .bodyMedium!
                          .copyWith(color: ColorManager.darkGrey),
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
