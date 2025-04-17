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

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 210.h),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Login here',
                    style: HelperFunction.textTheme(context).headlineLarge,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment:Alignment.center,
                    child: Text(
                      "Welcome back you've\nbeen missed!",
                      style: HelperFunction.textTheme(context)
                          .headlineSmall!
                          .copyWith(
                            color: ColorManager.black,
                            fontWeight: FontWeight.w600,
                          
                          ),
                          textAlign: TextAlign.center,
                    ),
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
                    hintText: 'Password',
                    isPassword: true,
                    textEditingController: _passwordController,
                    validator: (password) =>
                        ValidationHelper.isValidPassword(password),
                  ),
                  
                  SizedBox(
                    height: 33.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget your password?',
                      style: HelperFunction.textTheme(context)
                          .bodyMedium!
                          .copyWith(color: ColorManager.primary),
                    ),
                  ),
               
                  SizedBox(
                    height: 33.h,
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign in'),
                  ),
                                    SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.register);
                      },
                      child: Text(
                        'Create new account',
                        style: HelperFunction.textTheme(context)
                            .bodyMedium!
                            .copyWith(color: ColorManager.grey),
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
