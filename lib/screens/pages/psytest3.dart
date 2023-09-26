import 'package:flutter/material.dart';

class PsyTest3 extends StatefulWidget {
  const PsyTest3({ Key? key }) : super(key: key);

  @override
  _PsyTest3State createState() => _PsyTest3State();
}

class _PsyTest3State extends State<PsyTest3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B0082),
        title: Text('Тест на расстройство пищевого поведения'),
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
            Text('Тест на расстройство пищевого поведения'),
          ],
        ),
      ),
    );
  }
}