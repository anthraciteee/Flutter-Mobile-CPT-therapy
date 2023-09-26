import 'package:flutter/material.dart';

class BodysensPage extends StatelessWidget {
  final VoidCallback onBodyInfoPressed;
  final ValueChanged<String> onBodyChanged;

  BodysensPage({
    required this.onBodyInfoPressed,
    required this.onBodyChanged,
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
                      'Ощущения в теле',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: onBodyInfoPressed,
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
                    onChanged: onBodyChanged,
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

class BodyInfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
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
              'Вспомните какие неприятные ощущения в теле присутствовали в моменте. \n\nНапример: Участилось сердцебиение, заболела голова',
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