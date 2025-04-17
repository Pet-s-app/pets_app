import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_app/core/observer/bloc_observer.dart';
import 'package:pets_app/core/routes/route_generator.dart';
import 'package:pets_app/core/routes/routes.dart';
import 'package:pets_app/core/theme/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const Pets());
}

class Pets extends StatelessWidget {
  const Pets({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pets App',
          theme: lightTheme,
           
          initialRoute: Routes.startScreen,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
    );
  }
}
