import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_app/core/resources/color_manager.dart';
import 'package:pets_app/core/resources/font_manager.dart';
import 'package:pets_app/core/routes/routes.dart';
import 'package:pets_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:pets_app/core/utils/helpers/helper_functons.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 50.h),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/start_screen1.png',
                    width: 398.w,
                    height: 265.h,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/start_screen2.png',
                    width: 375.w,
                    height: 163.h,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Find Your Perfect Pet Match Here',
                    style: HelperFunction.textTheme(context).headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    "Find the perfect match for your furry friend —\nlove, play and companionship start here",
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, Routes.login);
                          },
                          child: const Text('Login'),

                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, Routes.register);
                          },
                          child: const Text('Register'),
                          buttonStyle: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Create new account',
                      style: HelperFunction.textTheme(context)
                          .bodyMedium!
                          .copyWith(color: ColorManager.grey),
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
