import 'package:flutter/material.dart';
import 'diaryform.dart';
import 'menu1.dart';

class DiaryScreen2 extends StatefulWidget {
  const DiaryScreen2({Key? key}) : super(key: key);

  @override
  _DiaryScreen2State createState() => _DiaryScreen2State();
}

class _DiaryScreen2State extends State<DiaryScreen2> {
  bool isConclusionVisible = false;

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF4B0082),
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Text(
    'Дневник мыслей',
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
    padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Мои записи',
    style: TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    Container(
    width: double.infinity,
    height: 80,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    ),
    child: GestureDetector(
    onTap: () {
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    return Container(
    height: 770.0,
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
    'Запись 1 / 26.06.2023',
    style: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    'Событие / Ситуация / Триггер:\n'
      'Я напортачил с задачей на работе\n\n'
      'Автоматическая мысль:\n'
        'Я постоянно совершаю ошибки\n\n'
      'Уровень веры:\n'
        '7\n\n'
        'Ощущения в теле:\n'
        'Участилость сердцебиение\n\n'
        'Поведение:\n'
        'Хлопнул дверью\n\n'
        'Эмоции:\n'
        'Вина: 3\n'
        'Разочарование: 3\n\n'
        'Альтернативный ответ:\n'
        'Нет людей, которые не совершают ошибки\n\n'
        'Вывод:\n'
        'Заведу чек лист для проверки своей работы\n',

    style: TextStyle(
    fontSize: 14.0,
    ),
    ),
    ],
    ),
    ),
    );
    },
    );
    },
    child: Row(
    children: [
    SizedBox(width: 16.0),
    Expanded(
    child: Text(
    '26.06.2023',
    style: TextStyle(
    fontSize: 18,
    ),
    ),
    ),
    Expanded(
    child: Text(
    'Запись 1',
    style: TextStyle(
    fontSize: 18,
    ),
    ),
    ),
    Expanded(
    child: Icon(Icons.arrow_forward_ios),
    )
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    floatingActionButton: Stack(
    children: [
    Positioned(
    bottom: appBarHeight + 20,
    right: 10,
    child: FloatingActionButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DiaryForm()),
    );
    },
    child: Icon(Icons.add, color: Colors.white),
    backgroundColor: Color(0xFF4B0082),
    ),
    ),
    ],
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    bottomNavigationBar: BottomAppBar(
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
      icon: Icon( Icons.home_filled, color: Colors.white, ), ), IconButton( onPressed: () {}, icon: Icon( Icons.ad_units_sharp, color: Colors.white, ), ), IconButton( onPressed: () {}, icon: Icon( Icons.collections_bookmark, color: Colors.white, ), ), IconButton( onPressed: () {}, icon: Icon( Icons.account_circle, color: Colors.white, ), ), ], ), ), ); } }