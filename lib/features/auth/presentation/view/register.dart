import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_app/core/resources/color_manager.dart';
import 'package:pets_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:pets_app/core/shared/widgets/deafult_text_field.dart';
import 'package:pets_app/core/utils/helpers/helper_functons.dart';
import 'package:pets_app/core/utils/helpers/validation_helper.dart';
import 'package:pets_app/core/utils/ui/ui_utils.dart';

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
  final FocusNode _userNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _phoneNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();
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
    _userNode.dispose();
    _emailNode.dispose();
    _phoneNode.dispose();
    _passwordNode.dispose();
    _confirmPasswordNode.dispose();
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
                    focusNode: _userNode,
                    textEditingController: _userNameController,
                    textCapitalization: TextCapitalization.words,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_emailNode),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'Email',
                    focusNode: _emailNode,
                    textEditingController: _emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (email) => ValidationHelper.isValidEmail(email),
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_phoneNode),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'phone',
                    focusNode: _phoneNode,
                    textEditingController: _phoneController,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordNode),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'Password',
                    focusNode: _passwordNode,
                    textEditingController: _passwordController,
                    isPassword: true,
                    validator: (password) =>
                        ValidationHelper.isValidPassword(password),
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_confirmPasswordNode),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  DefaultTextFormField(
                    hintText: 'Confrim password',
                    focusNode: _confirmPasswordNode,
                    isPassword: true,
                    textEditingController: _confrimPasswordController,
                    validator: (confrimPassword) =>
                        ValidationHelper.isValidConfirmPassword(
                      confrimPassword,
                      _passwordController,
                    ),
                    onEditingComplete: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      UIUtils.showLoading(context);
                    },
                    child: const Text('Sign Up'),
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  Text(
                    'Already have an account',
                    style: HelperFunction.textTheme(context)
                        .bodyMedium!
                        .copyWith(color: ColorManager.darkGrey),
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
