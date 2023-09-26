import 'package:flutter/material.dart';

class PsyTest2 extends StatefulWidget {
  const PsyTest2({ Key? key }) : super(key: key);

  @override
  _PsyTest2State createState() => _PsyTest2State();
}

class _PsyTest2State extends State<PsyTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B0082),
        title: Text('Тест на уровень депрессии'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
          ),
        ),
        child: Column(
          children: [
            // Реализуйте здесь ваш тест на уровень тревожности
            Text('Тест на уровень депрессии'),
          ],
        ),
      ),
    );
  }
}