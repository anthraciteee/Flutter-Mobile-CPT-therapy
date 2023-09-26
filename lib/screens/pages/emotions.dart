import 'package:flutter/material.dart';

class EmotionsPage extends StatelessWidget {
  final List<String> emotions = [
    'Раздражение',
    'Радость',
    'Вина',
    'Волнение',
    'Апатия',
    'Восторг',
    'Гнев',
    'Горе',
    'Грусть',
    'Досада',
    'Любовь',
    'Надежда',
    'Одиночество',
    'Обида',
    'Оптимизм',
    'Отвращение',
    'Паника',
    'Печаль',
    'Разочарование',
    'Симпатия',
    'Скука',
    'Смущение',
    'Сожаление',
    'Страх',
    'Стыд',
    'Счастье',
    'Тревога',
    'Уверенность',
    'Удовлетворение',
    'Ужас',
    'Усталость',
    'Ярость',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 64.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Эмоции',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 2.0,
                children: emotions.map((emotion) {
                  return EmotionButton(
                    text: emotion,
                    inactiveColor: Colors.white.withOpacity(0.5),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmotionButton extends StatefulWidget {
  final String text;
  final Color inactiveColor;

  const EmotionButton({
    Key? key,
    required this.text,
    required this.inactiveColor,
  }) : super(key: key);

  @override
  State<EmotionButton> createState() => _EmotionButtonState();
}

class _EmotionButtonState extends State<EmotionButton> {
  int _counter = 0;
  bool _isEmotionActive = false;

  void _showIntensityDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 130.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Интенсивность эмоции',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IntensityButton(
                    text: '1',
                    onPressed: () {
                      setState(() {
                        _counter = 1;
                        _isEmotionActive = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  IntensityButton(
                    text: '2',
                    onPressed: () {
                      setState(() {
                        _counter = 2;
                        _isEmotionActive = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  IntensityButton(
                    text: '3',
                    onPressed: () {
                      setState(() {
                        _counter = 3;
                        _isEmotionActive = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _showIntensityDialog,
        child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
    border: Border.all(
    color: widget.inactiveColor,
    ),
    color: _isEmotionActive ? Colors.deepPurple.withOpacity(0.5) : Colors.transparent,
    ),
    child: Center(
    child: Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    '$_counter',
    style: TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    ),
    ),
    SizedBox(height: 8.0,),
    Text(
    widget.text,
    style: TextStyle(
    color: _isEmotionActive ? Colors.white : widget.inactiveColor,
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    );
  }
}

class IntensityButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const IntensityButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(16.0),
        primary: Colors.white,
        onPrimary: Colors.black,
      ),
    );
  }
}


