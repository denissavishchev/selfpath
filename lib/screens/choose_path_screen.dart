import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selfpath/constants.dart';
import 'package:selfpath/providers/choose_path_provider.dart';
import 'package:selfpath/widgets/language_widget.dart';

class ChoosePathScreen extends StatelessWidget {
  const ChoosePathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Consumer<ChoosePathProvider>(
            builder: (context, data, _){
              int count0 = data.answers.where((e) => e == 0).length;
              int count1 = data.answers.where((e) => e == 1).length;
              int count2 = data.answers.where((e) => e == 2).length;
              int count3 = data.answers.where((e) => e == 3).length;
              return Padding(
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
                      child: data.selectedQuestion != 0
                        ? Column(
                          spacing: 24,
                          children: [
                            Text('question${data.selectedQuestion}'.tr(), style: kTextStyle,),
                            Column(
                              spacing: 20,
                              children: List.generate(4, ((i){
                                return QuestionContainer(index: i,);
                              })),
                            ),
                            ElevatedButton(
                                onPressed: (){
                                  if(data.selectedAnswer != -1){
                                    data.toNextQuestion();
                                  }
                                },
                                child: Text('next'.tr(), style: kTextStyle,)
                            )
                          ],
                        )
                          : Text('done'.tr(), style: kTextStyle,)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('a: $count0'),
                        Text('b: $count1'),
                        Text('c: $count2'),
                        Text('d: $count3'),
                      ],
                    )
                  ],
                ),
              );
            }
        )
      ),
    );
  }
}

class QuestionContainer extends StatelessWidget {
  const QuestionContainer({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer<ChoosePathProvider>(
        builder: (context, data, _){
          return GestureDetector(
            onTap: () => data.selectAnswer(index),
            child: Container(
              width: size.width,
              height: size.height * 0.05,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  color: data.selectedAnswer == index ? kWhite : kDark,
                  boxShadow: [
                    BoxShadow(
                        color: data.selectedAnswer == index
                            ? Colors.transparent
                            : kWhite.withValues(alpha: 0.2),
                        blurRadius: 1,
                        spreadRadius: 1,
                    )
                  ]
              ),
              child: Text('question${data.selectedQuestion}${index + 1}'.tr(), style: kTextStyle,),
            ),
          );
        }
    );
  }
}
