import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_service.dart';
import 'menu1.dart';
import 'diary.dart';
import 'tests.dart';
import 'literature.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B0082),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Профиль',
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
        child: Stack(
          children: [
            _buildUserInfo(context),
            _buildBottomAppBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SizedBox(height: 20),
    Row(
    children: [
      SizedBox(width: 10),
    Icon(
    Icons.person,
    color: Colors.white,
    ),
    SizedBox(width: 10),
    Text(
      'Имя пользователя: ${user.displayName}',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ],
    ),
    SizedBox(height: 10),
    Row(
    children: [
    SizedBox(width: 40),
    ],
    ),
    SizedBox(height: 20),
    Row(
    children: [
      SizedBox(width: 10),
    Icon(
    Icons.email,
    color: Colors.white,
    ),
    SizedBox(width: 10),
    Text(
    'Почта: ${user.email}',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ],
    ),
    SizedBox(height: 10),
    Row(
    children: [
    SizedBox(width: 40),
    ],
    ),
    SizedBox(height: 20),
    StreamBuilder<User?>(
    stream: FirebaseService().auth.userChanges(),
    builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
    if (snapshot.data == null) {
    return Row(
    children: [
      SizedBox(width: 10),
    Icon(
    Icons.error,
    color: Colors.white,
    ),
    SizedBox(width: 10),
    Text(
    'Пользователь не найден',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ],
    );
    }
    final user = snapshot.data!;
    user.reload();
    if (user.emailVerified) {
    return Row(
    children: [
      SizedBox(width: 10),
    Icon(
    Icons.check_circle,
    color: Colors.white,
    ),
    SizedBox(width: 10),
    Text(
    'Подтверждение почты:',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    SizedBox(width: 10),
    Text(
      '${user.emailVerified ? "подтверждено" : "не подтверждено"}',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ],
    );
    } else {
    return Column(
    children: [
    Row(
    children: [
      SizedBox(width: 10),
    Icon(
    Icons.error,
    color: Colors.white,
    ),
    SizedBox(width: 10),
    Text(
    'Подтверждение почты:',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    SizedBox(width: 10),
    Text(
      '${user.emailVerified ? "подтверждено" : "не подтверждено"}',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ],
    ),
    SizedBox(height: 10),
    Row(
    children: [
    SizedBox(width: 40),
    TextButton(
    onPressed: () {
    FirebaseService().onVerifyEmail();
    },
    child: Row(
    children: [
      SizedBox(width: 10),
    Icon(
    Icons.email,
    color: Colors.white,
    ),
    SizedBox(width: 10),
    Text(
    'Подтвердить почту',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ],
    );
    }
    },
    ),
    SizedBox(height: 20),
    Row(
    children: [
      SizedBox(width: 10),
    Icon(
    Icons.exit_to_app,
    color: Colors.white,
    ),
    SizedBox(width: 2),
      TextButton(
        onPressed: () {
          FirebaseService().logOut();
        },
        child: Text(
          'Выход из аккаунта',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
    ),
        ],
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: BottomAppBar(
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
                  MaterialPageRoute(builder: (context) => DiaryScreen()),
                );
              },
              icon: Icon(
                Icons.book,
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
                Icons.question_answer,
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
                Icons.menu_book,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }}