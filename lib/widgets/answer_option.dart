// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/controller/quiz_controller.dart';

class AnswerOption extends StatelessWidget {
  String text;
  int index, questionID;
  Function() onPressed;

  AnswerOption(
      {super.key,
      required this.text,
      required this.index,
      required this.questionID,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        init: QuizController(),
        builder: (controller) => InkWell(
            onTap: controller.checkIsQuestionAnswered(questionID)
                ? null
                : onPressed,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(width: 3, color: controller.getColor(index))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '${index + 1} .   ',
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)),
                          // style: Theme.of(context).textTheme.headline6,
                          children: [
                            TextSpan(
                              text: text,
                              style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold)),
                              // style: Theme.of(context).textTheme.headline6,
                            ),
                          ]),
                    ),
                    if (controller.checkIsQuestionAnswered(questionID) &&
                        controller.selectAnswer == index)
                      Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.getColor(index),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              shape: BoxShape.circle),
                          child: Icon(
                            controller.getIcon(index),
                            color: Colors.white,
                          ))
                  ],
                ),
              ),
            )));
  }
}
