import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:selfpath/choose_path_screen.dart';
import 'package:selfpath/providers/choose_path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ChoosePathProvider>(create: (_) => ChoosePathProvider()),
        ],
        builder: (context, child) {
          return ScreenUtilInit(
            designSize: const Size(720, 1560),
            builder: (_, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: ChoosePathScreen(),
            ),
          );
        }
    );
  }
}

