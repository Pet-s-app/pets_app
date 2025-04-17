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

class Emailcheck extends StatefulWidget {
  const Emailcheck({super.key});

  @override
  State<Emailcheck> createState() => _EmailcheckState();
}

class _EmailcheckState extends State<Emailcheck> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
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
                  Image.asset(
                    'assets/images/emailcheck.png',
                    width: 389.w,
                    height: 389.h,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Enter Your Email',
                    style: HelperFunction.textTheme(context)
                        .headlineLarge!
                        .copyWith(
                          color: ColorManager.black,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    "We Will send you a Confirmation Code",
                    style: HelperFunction.textTheme(context)
                        .headlineSmall!
                        .copyWith(
                          color: ColorManager.grey,
                          fontWeight: FontWeightManager.medium,
                          fontSize: 15.sp,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 33.h,
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
                    height: 33.h,
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Send Code',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold, 
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
