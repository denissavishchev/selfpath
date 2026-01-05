import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:selfpath/constants.dart';
import 'package:selfpath/widgets/flag_widget.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('language'.tr(),style: kTextStyle,),
                  GestureDetector(
                      onTap: () => context.setLocale(const Locale('en', 'US')),
                      child: const FlagWidget(country: 'GB')),
                  GestureDetector(
                      onTap:  () => context.setLocale(const Locale('pl', 'PL')),
                      child: const FlagWidget(country: 'PL')),
                  GestureDetector(
                      onTap: () => context.setLocale(const Locale('ru', 'RU')),
                      child: const FlagWidget(country: 'RU')),
                ],
              ),
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
