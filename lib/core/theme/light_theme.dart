import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_app/core/resources/color_manager.dart';
import 'package:pets_app/core/resources/font_manager.dart';

final lightTheme = ThemeData(
  primaryColor: ColorManager.primary,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  }),
  // appBarTheme: AppBarTheme(
  //   centerTitle: true,
  //   titleTextStyle: GoogleFonts.roboto(
  //     color: ThemeColors.yellow,
  //     fontSize: 16,
  //   ),
  //   iconTheme: const IconThemeData(
  //     color: ThemeColors.yellow,
  //   ),
  //   backgroundColor: ThemeColors.black,
  //   surfaceTintColor: ThemeColors.black,
  //   foregroundColor: ThemeColors.yellow,
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.primary,
      fixedSize: Size(double.infinity, 74.h),
      textStyle: GoogleFonts.inter(
        color: ColorManager.white,
        fontSize: FontSize.s24,
      ),
      foregroundColor: ColorManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          13.r,
        ),
      ),
      minimumSize: Size(double.infinity, 74.h),
    ),
  ),
  // outlinedButtonTheme: OutlinedButtonThemeData(
  //   style: OutlinedButton.styleFrom(
  //     fixedSize: Size(double.infinity, 55.h),
  //     textStyle: GoogleFonts.roboto(
  //       color: ThemeColors.yellow,
  //       fontSize: 20,
  //     ),
  //     foregroundColor: ThemeColors.yellow,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(
  //         15.r,
  //       ),
  //     ),
  //     side: const BorderSide(
  //       color: ThemeColors.yellow,
  //     ),
  //   ),
  // ),
  scaffoldBackgroundColor: ColorManager.white,
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 40.sp,
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.primary,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.grey,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: FontSize.s16,
      color: ColorManager.grey,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 24.sp,
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.black,
    ),
    headlineLarge: GoogleFonts.inter(
      fontSize: 32.sp,
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.primary,
    ),
  ),
  // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //   backgroundColor: ThemeColors.grey,
  //   selectedItemColor: ThemeColors.yellow,
  //   unselectedItemColor: ThemeColors.white,
  //   selectedIconTheme: IconThemeData(
  //     color: ThemeColors.yellow,
  //   ),
  //   unselectedIconTheme: IconThemeData(
  //     color: ThemeColors.white,
  //   ),
  //   showSelectedLabels: false,
  //   showUnselectedLabels: false,
  //   type: BottomNavigationBarType.fixed,
  //   elevation: 0,
  // ),
);
