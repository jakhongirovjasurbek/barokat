import 'dart:async';

import 'package:barokat/core/singletons/singletons.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/core/routes/platform_route.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main(List<Object> args) async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await ScreenUtil.ensureScreenSize();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      await setupLocator();

      runApp(const BarokatApp());
    },
    (error, stacktrace) {
      print('Exception, $error, \n$stacktrace');
      // TODO: Handle exception
    },
  );
}

class BarokatApp extends StatelessWidget {
  const BarokatApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          ScreenUtil.init(context);

          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xFFDAE2E2),
              appBarTheme: const AppBarTheme(
                backgroundColor: const Color(0xFFDAE2E2),
              )
            ),
            debugShowCheckedModeBanner: false,
            themeAnimationCurve: Curves.slowMiddle,
            onGenerateRoute: PlatformRouter.onGenerateRoute,
            supportedLocales: AppLocalization.delegate.supportedLocales,
            localizationsDelegates: const [
              AppLocalization.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
