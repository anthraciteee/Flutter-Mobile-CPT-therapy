import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/tests.dart';

class PsyTest1 extends StatefulWidget {
  const PsyTest1({Key? key}) : super(key: key);

  @override
  _PsyTest1State createState() => _PsyTest1State();
}

class _PsyTest1State extends State<PsyTest1> {
  int _totalScore = 0;

  // Определение списка вопросов теста
  final questions = [
    {
      'questionText': 'Вы ощущали беспокойство?',
      'answers': [
        {'text': 'Нет', 'score': 0},
        {'text': 'Легкая тревожность или беспокойство', 'score': 1},
        {'text': 'Модератная тревожность или беспокойство', 'score': 2},
        {'text': 'Выраженная тревожность или беспокойство', 'score': 3},
      ],
    },
    {
      'questionText': 'Вы ощущали напряжение?',
      'answers': [
        {'text': 'Нет', 'score': 0},
        {'text': 'Легкое напряжение', 'score': 1},
        {'text': 'Модератное напряжение', 'score': 2},
        {'text': 'Выраженное напряжение', 'score': 3},
      ],
    },
    {
      'questionText': 'Вы ощущали страх?',
      'answers': [
        {'text': 'Нет', 'score': 0},
        {'text': 'Легкий страх', 'score': 1},
        {'text': 'Модератный страх', 'score': 2},
        {'text': 'Выраженный страх', 'score': 3},
      ],
    },
    // Добавьте дополнительные вопросы, если нужно
  ];

  // Определение текущего индекса вопроса
  var _questionIndex = 0;

  // Обработчик выбора ответа
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  // Обработчик перезапуска теста
  void _restartTest() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xFF4B0082),
        title: Text('Тест на уровень тревожности'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4B0082),
              Color(0xFFDA70D6),
            ],
          ),
        ),
        child: Center(
          child: _questionIndex < questions.length
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // От��бражение текущего вопроса
              Text(
                questions[_questionIndex]['questionText'] as String,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Отображение вариантов ответа
              ...((questions[_questionIndex]['answers']
              as List<Map<String, Object>>)
                  .map((answer) =>
                  ElevatedButton(
                    child: Text(answer['text'] as String),
                    onPressed: () =>
                        _answerQuestion(answer['score'] as int),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                  ))
                  .toList())
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Отображение итогового результата
              Text(
                'Ваш уровень тревожности: $_totalScore',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Пропишите кнопку для перезапуска теста
              ElevatedButton(
                child: Text('Перезапустить тест'),
                onPressed: _restartTest,
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
              ),

              // Пропишите кнопку для выхода из теста
              ElevatedButton(
                child: Text('Выйти из теста'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestsScreen())
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}