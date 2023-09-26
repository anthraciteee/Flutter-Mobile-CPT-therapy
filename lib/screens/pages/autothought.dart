import 'package:flutter/material.dart';

class AutoPage extends StatelessWidget {
  final VoidCallback onAutoInfoPressed;
  final ValueChanged<String> onAutoChanged;

  AutoPage({
    required this.onAutoInfoPressed,
    required this.onAutoChanged
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
            ),
          ),
        ),
        Positioned(
          top: 100.0,
          left: 16.0,
          right: 16.0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Автоматическая мысль',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: onAutoInfoPressed,
                      icon: Icon(Icons.info_outline),
                      label: SizedBox.shrink(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    maxLines: 5,
                    onChanged: onAutoChanged,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AutoInfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.0,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Пояснение',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Автоматические мысли приводят к возникновению негативных эмоций и порождаются событием.\n'
                  'Эмоции в свою очередь вызывают возникновение новых автоматических мыслей. Получается круговорот негатива, из которого тяжело вырваться.\n'
                  'Чтобы предотвратить его возникновение запишите автоматическую мысль в дневник. \n\nНапример: Я постоянно совершаю ошибки в работе, все вокруг ненавидят меня за это',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}