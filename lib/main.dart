import 'package:cbq_tasks/l10n/l10n.dart';
import 'package:cbq_tasks/src/features/connectivity/error_screen.dart';
import 'package:cbq_tasks/src/provider/theme/theme_provider.dart';
import 'package:cbq_tasks/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const ProviderScope(
      child: TodoApp(),
    );
  }
}

class TodoApp extends StatelessWidget {
  const TodoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final router = ref.watch(routerProvider);
      final locale = ref.watch(localeProvider);

      return MaterialApp.router(
        title: 'Flutter Demo',
        builder: (context, child) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return ErrorScreen(
              errorMessage: errorDetails.toString(),
            );
          };
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: locale,
        supportedLocales: L10n.all,
        debugShowCheckedModeBanner: false,
        theme: ref.watch(themeProvider),
        routerConfig: router,
      );
    });
  }
}
