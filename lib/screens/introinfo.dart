import 'package:flutter/material.dart';
import 'menu1.dart';

class IntroInfoScreen extends StatefulWidget {
  IntroInfoScreen({Key? key}) : super(key: key);

  @override
  _IntroInfoScreenState createState() => _IntroInfoScreenState();
}

class _IntroInfoScreenState extends State<IntroInfoScreen> {
  final _pageController = PageController(initialPage: 0);
  final _pages = [
    {
      'title': 'Добро пожаловать в CogniLyst',
      'description': 'Ваш помощник по борьбе с деструктивными мыслями',
      'image': 'assets/diary.png',
    },
    {
      'title': 'Попробуйте СМЭР-дневник мыслей',
      'description': 'Дневник автоматических мыслей помогает пользователям понимать, как их мысли влияют на их настроение, поведение и эмоциональное состояние. Работа с дневником автоматических мыслей - это один из основных инструментов когнитивной поведенческой терапии, который помогает пользователям лучше понимать свои мысли и эмоции, а также избавляться от психологических проблем.',
      'image': 'assets/diary.png',
    },
    {
      'title': 'Познакомьтесь с КПТ-терапией',
      'description': 'Проходите психологические тесты и ознакомьтесь с рекомендуемой литературой! Представлены 3 психологических теста и 6 популярных книг по КПТ-терапии.',
      'image': 'assets/diary.png',
    }
  ];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4B0082),
              Color(0xFFDA70D6),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _pages[index]['image']!,
                          width: 200,
                          height: 200,
                        ),
                        SizedBox(height: 48),
                        Text(
                          _pages[index]['title']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(
                            _pages[index]['description']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu1()),
                  );
                },
                child: Text('Пропустить'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 48,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _pages.length; i++) {
      list.add(_indicator(i == _currentPage));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      width: isActive ? 16 : 8,
      height: isActive ? 16 : 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
      ),
    );
  }
}
