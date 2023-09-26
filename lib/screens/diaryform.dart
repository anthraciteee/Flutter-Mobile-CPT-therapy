import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/pages/situation.dart';
import 'package:flutter_firebase/screens/pages/autothought.dart';
import 'package:flutter_firebase/screens/pages/faith_level.dart';
import 'package:flutter_firebase/screens/pages/bodysens.dart';
import 'package:flutter_firebase/screens/pages/behavior.dart';
import 'package:flutter_firebase/screens/pages/emotions.dart';
import 'package:flutter_firebase/screens/pages/alternative.dart';
import 'package:flutter_firebase/screens/pages/conclusion.dart';
import 'package:flutter_firebase/screens/diary2.dart';

class DiaryForm extends StatefulWidget {
  @override
  _DiaryFormState createState() => _DiaryFormState();
}

class _DiaryFormState extends State<DiaryForm> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  double _faithLevel = 0.0;
  Map<String, dynamic> _diaryData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
        onTap: () {
      // Определяем ширину экрана
      double screenWidth = MediaQuery.of(context).size.width;
      // Если пользователь кликнул по правой части экрана,
      // то прокручиваем карусель на следующий экран
      if (screenWidth / 2 < MediaQuery.of(context).size.width) {
        _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    },
    child: Stack(
    children: [
    PageView(
    controller: _controller,
    onPageChanged: (int page) {
    setState(() {
    _currentPage = page;
    });
    },
    // Меняем порядок элементов таким образом,
    // чтобы последний элемент был справа
    children: [
    SituationPage(
    onChanged: (value) {
    // Обработка изменения текста
    },
    onInfoPressed: () {
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    return InfoDialog();
    },
    );
    },
    ),
    AutoPage(
    onAutoChanged: (value) {
    // Обработка изменения текста
    },
    onAutoInfoPressed: () {
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    return AutoInfoDialog();
    },
    );
    },
    ),
    FaithLevelPage(
    faithLevel: _faithLevel,
    onFaithLevelChanged: (value) {
    setState(() {
    _faithLevel = value;
    });
    },
    ),
    BodysensPage(
    onBodyChanged: (value) {
    // Обработка изменения текста
    },
    onBodyInfoPressed: () {
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    return BodyInfoDialog();
    },
    );
    },
    ),
    BehaviorPage(
    onBehaviorChanged: (value) {
    // Обработка изменения текста
    },
    onBehaviorInfoPressed: () {
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    return BehaviorInfoDialog();
    },
    );
    },
    ),
      EmotionsPage(),
    AlterPage(
    onAlterChanged: (value) {
    // Обработка изменения текста
    },
    onAlterInfoPressed: () {
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    return AlterInfoDialog();
    },
    );
    },
    ),
    ConclusionPage(
    onConclusionChanged: (value) {
    // Обработка изменения текста
    },
    onConclusionInfoPressed: () {
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    return ConclusionInfoDialog();
    },
    );
    },
    ),
    ],
    ),
    Positioned(
    left: 0.0,
    bottom: 20.0,
    right: 0.0,
    child: _currentPage != 5
    ? Container(
    height: 4.0,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
    children: List.generate(
    8, // количество элементов остается 8
    (index) {
    if (index == 5) {
    // для 6 экрана не генерируем элемент с полоской
    return Container();
    } else {
    return Expanded(
    child: Container(
    height: 4.0,
    margin: EdgeInsets.only(left: index == 0 ? 0.0 : 8.0),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(4.0),
    color: _currentPage >= index
    ? Colors.deepPurple
        : Colors.white.withOpacity(0.5),
    ),
    ),
    );
    }
    },
    ),
    ),
    ) : Container(),
    ),
    _currentPage == 7
    ? Positioned(
    left: MediaQuery.of(context).size.width / 2 - 80,
    bottom: MediaQuery.of(context).size.height / 2 - 80 - 100,
    child: Container(
    height: 160,
    width: 160,
    child: FloatingActionButton(
    backgroundColor: Colors.deepPurple,
    heroTag: null,
    child: Text(
    'Сохранить',
    style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DiaryScreen2()),
    );
    },
    ),
    ),
    )
        : Container(),
    ],
    ),
    ),
    );
  }
}