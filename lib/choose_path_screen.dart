import 'package:flutter/material.dart';
import 'package:selfpath/constants.dart';
import 'package:selfpath/widgets/language_widget.dart';

class ChoosePathScreen extends StatelessWidget {
  const ChoosePathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            spacing: 12,
            children: [
              LanguageWidget(),
              Container(
                width: size.width,
                height: size.height * 0.75,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kGreyDark,
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
