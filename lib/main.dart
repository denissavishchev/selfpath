import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:selfpath/choose_path_screen.dart';
import 'package:selfpath/providers/choose_path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pl', 'PL'),
        Locale('ru', 'RU'),],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider<ChoosePathProvider>(create: (_) => ChoosePathProvider()),
          ],
          builder: (context, child) {
            return ScreenUtilInit(
              designSize: const Size(720, 1560),
              builder: (_, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                home: ChoosePathScreen(),
              ),
            );
          }
      ),
    );
  }
}

