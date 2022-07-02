import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'Which is your favourite class?',
      'answers': [
        {'text': 'Transfiguration', 'score': 4},
        {'text': 'Potions', 'score': 3},
        {'text': 'History of Magic', 'score': 2},
        {'text': 'Charms', 'score': 1},
      ],
    },
    {
      'questionText': 'If you could do one thing for the rest of your life...',
      'answers': [
        {'text': 'Start your own business', 'score': 4},
        {'text': 'Travel', 'score': 3},
        {'text': 'Study', 'score': 2},
        {'text': 'Raise a family', 'score': 1},
      ],
    },
    {
      'questionText':
          'Which of these most accurately describes your relationship with people?',
      'answers': [
        {
          'text':
              'I tend to wary away from people,so i don\'t have much friends',
          'score': 2
        },
        {
          'text':
              'I find myselves becoming friends with people who can help me succeed',
          'score': 3
        },
        {
          'text': 'I have a few close friends that I would trust my life ',
          'score': 4
        },
        {
          'text':
              'I love surrounding myselves with people- the more friends I have the merrier',
          'score': 1
        },
      ],
    },
    {
      'questionText': 'Your Patronus Charm would be a ...',
      'answers': [
        {'text': 'Panther', 'score': 4},
        {'text': 'Dragon', 'score': 3},
        {'text': 'Fox', 'score': 2},
        {'text': 'Hedgehog', 'score': 1},
      ],
    },
  ];

  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore = totalScore + score;
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
    if (questionIndex < questions.length) {
      print('Proceed to next Question');
    } else {
      print('Quiz is Over');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent[700],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Hogwart\'s Sorting Hat'),
          backgroundColor: Colors.black,
        ),
        body: questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
              )
            : Result(totalScore, resetQuiz),
      ),
    );
  }
}
