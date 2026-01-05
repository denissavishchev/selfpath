import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  static const List<Locale> locales = [
    Locale('en', 'GB'),
    Locale('pl', 'PL'),
    Locale('ru', 'RU'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('language'.tr(),style: kTextStyle,),
        Row(
          spacing: 18,
          children: List.generate(locales.length, ((i){
            return GestureDetector(
                onTap: () => context.setLocale(locales[i]),
                child: CountryFlag.fromCountryCode(
                  '${locales[i].countryCode}',
                  theme: ImageTheme(
                    height: 36,
                    width: 46,
                    shape: RoundedRectangle(8),
                  ),
                ));
          })),
        )
      ],
    );
  }
}



