import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tests.dart';
import 'user_info_screen.dart';
import 'menu1.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LitScreen extends StatelessWidget {
  final Map<String, String> _books = {
    'book1': 'https://www.litres.ru/book/robert-lihi-13115294/preodolenie-soprotivleniya-v-kognitivnoy-terapii-58145923/',
    'book2': 'https://www.litres.ru/book/kristofer-germer/trudnye-chuvstva-ponyat-sebya-prostit-drugih-64053977/',
    'book3': 'https://www.litres.ru/book/debora-dobson/nauchno-obosnovannaya-praktika-v-kognitivno-povedencheskoy-t-63712077/',
    'book4': 'https://www.litres.ru/book/devid-a-klark/trevoga-i-strahi-kak-ih-preodolet-68767509/',
    'book5': 'https://www.litres.ru/book/ilya-kachay/kognitivno-povedencheskaya-terapiya-prakticheskoe-posobie-dlya-68994703/',
    'book6': 'https://www.litres.ru/book/dzhudit-bek/kognitivnaya-terapiya-polnoe-rukovodstvo-38842176/',
  };

  Widget _createButton(String bookTitle) {
    return ElevatedButton(
      onPressed: () async {
        await launch(_books[bookTitle] ?? "");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/$bookTitle.png',
            width: 150.0,
            height: 150.0,
          ),
          SizedBox(height: 8.0),
          SizedBox(),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.black,
          ),
        ),
        minimumSize: Size(150, 150),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B0082),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Литература',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
      Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
      ),
    ),
    child: Center(
    child: GridView.count(
    crossAxisCount: 2,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    shrinkWrap: true,
    children: _books.keys.map((bookTitle) {
    return _createButton(bookTitle);
    }).toList(),
    ),
    ),
    ),
    Positioned(
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
    MaterialPageRoute(builder: (context) => TestsScreen()),
    );
    },
    icon: Icon(
    Icons.ad_units_sharp,
    color: Colors.white,
    ),
    ),
    IconButton(
    onPressed: () {},
    icon: Icon(
    Icons.collections_bookmark,
    color: Colors.white,
    ),
    ),
    IconButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => UserInfoScreen(user: FirebaseAuth.instance.currentUser!)), ); }, icon: Icon( Icons.account_circle, color: Colors.white, ), ), ], ), ), ), ], ), ); } }