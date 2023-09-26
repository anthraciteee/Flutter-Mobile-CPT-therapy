import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/pages/psytest1.dart';
import 'package:flutter_firebase/screens/pages/psytest2.dart';
import 'package:flutter_firebase/screens/pages/psytest3.dart';
import 'literature.dart';
import 'menu1.dart';
import 'user_info_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF4B0082),
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Text(
    'Психологические тесты',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ),
    body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
    ),
    ),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SizedBox(
    width: 280,
    height: 80,
    child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PsyTest1()),
      );
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.transparent,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40.0),
    side: BorderSide(
    color: Colors.white,
    width: 1,
    ),
    ),
    ),
    child: Text(
    'Тест на уровень тревожности',
    textAlign: TextAlign.center,
    style: TextStyle(
    color: Colors.white,
    fontSize: 18,
    ),
    ),
    ),
    ),
    SizedBox(height: 20),
    SizedBox(
    width: 280,
    height: 80,
    child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PsyTest2()),
      );
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.transparent,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40.0),
    side: BorderSide(
    color: Colors.white,
    width: 1,
    ),
    ),
    ),
    child: Text(
    'Тест на уровень депрессии',
    textAlign: TextAlign.center,
    style: TextStyle(
    color: Colors.white,
    fontSize: 18,
    ),
    ),
    ),
    ),
    SizedBox(height: 20),
    SizedBox(
    width: 280,
    height: 80,
    child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PsyTest3()),
      );
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.transparent,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40.0),
    side: BorderSide(
    color: Colors.white,
    width: 1,
    ),
    ),
    ),
    child: Text(
    'Тест на расстройство пищевого поведения',
    textAlign: TextAlign.center,
    style: TextStyle(
    color: Colors.white,
    fontSize: 18,
    ),
    ),
    ),
    ),
    SizedBox(height: 20),
    ],
    ),
    ),
    ),
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
    ], ), ), ); } }
