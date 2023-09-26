import 'package:flutter/material.dart';
import 'diary.dart';
import 'theory.dart';
import 'tests.dart';
import 'literature.dart';
import 'user_info_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu1 extends StatelessWidget {
  final List<Map<String, dynamic>> buttons = [
    {
      'text': 'Подобрать психолога',
      'image': 'assets/find.jpg',
    },
    {
      'text': 'Что такое СМЭР?',
      'image': 'assets/about.png',
    },
    {
      'text': 'Психологические тесты',
      'image': 'assets/tests.png',
    },
    {
      'text': 'Как использовать КПТ-терапию',
      'image': 'assets/how.png',
    },
  ];

  Menu1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B0082),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Главная',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DiaryScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/diary.png',
                        fit: BoxFit.cover,
                        width: 125,
                        height: 125,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'СМЭР-Дневник',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Ваш инструмент для работы с мыслями',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Рекомендации',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: buttons.length,
                itemBuilder: (BuildContext context, int index) {
                  final button = buttons[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () {
                          if (index == 0) {
                            launch('https://zigmund.online/');
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TheoryScreen()),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TestsScreen()),
                            );
                          } else if (index == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LitScreen()),
                            );
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              button['image'],
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                              // Уменьшаем отступы вокруг изображения
                              alignment: Alignment.center,
                              // Уменьшаем размеры Padding вокруг изображения
                            ),
                            SizedBox(height: 8),
                            Text(
                              button['text'],
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            BottomAppBar(
              color: Colors.purple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Menu1()),
                      );
                    },
                    icon: Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestsScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.ad_units_sharp,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LitScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.collections_bookmark,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserInfoScreen(user: FirebaseAuth.instance.currentUser!)),
                      );
                    },
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } }

