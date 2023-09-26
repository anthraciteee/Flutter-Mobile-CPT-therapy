import 'package:flutter/material.dart';
import 'tests.dart';
import 'literature.dart';
import 'user_info_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'menu1.dart';

class TheoryScreen extends StatelessWidget {
  const TheoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B0082),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Что такое СМЭР?',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
      ),
    ),
    padding: EdgeInsets.all(16),
    child: Column(
    children: [
    Text(
    'Мобильные приложения, использующие КПТ-терапию в большинстве случаев, имеют в своем функционале основной инструмент – дневник мыс-лей и чувств СМЭР (ситуация-мысль-эмоция-реакция). Данный инструмент предназначен для того, чтобы научиться отслеживать свои автоматические негативные мысли. Именно наши мысли влияют на эмоции, а не какое-либо событие.\n\n'
    'Используя дневник, мы можем четко увидеть автоматические негативные мысли, проследить как они появились, какие эмоции вызвали, а в дальнейшем, научиться анализировать их и оспаривать.\n\n'
    'Важно отследить в какой момент изменилось настроение по следующему алгоритму:\n'
    '- ситуация; описывается какое событие произошло; например, коллега неодобрительно посмотрела, когда я проявил инициативу на планёрке;\n'
    '- мысль; нужно разобрать какие мысли и образы возникли в этот момент;\n'
    '- эмоция; какие эмоции появились вслед за мыслью;\n'
    '- реакция; это поведенческие реакции на данную ситуацию и эмоции; реакция может быть различной, включая избегание, агрессию, панику.\n\n'
    'В мобильных приложениях дневник мыслей может быть реализован через интерактивный интерфейс, в котором пользователь постепенно заполняет форму по алгоритму СМЭР. Пользователь может указать свои эмоции, которые возникли в результате ситуации, и описать их подробно. Это помогает пользователю осознавать, какие эмоции наиболее часто возникают, и как они могут влиять на его общее благополучие и поведение. Путем регулярного ведения дневника пользователь может обнаружить повторяющиеся мысли, которые усиливают негативные эмоции, и постепенно менять их на более позитивные и реалистичные. Это может привести к улучшению самоосознания, эмоциональной регуляциии общего благополучия.\n\n' 'СМЭР дневник мыслей в мобильной разработке может быть мощным инструментом для самонаблюдения и развития эмоциональной интеллектуальности. Он предоставляет возможность пользователям активно работать над своими мыслями, эмоциями и реакциями, а также сознательно формировать более здоровые и позитивные паттерны мышления и поведения.\n\n' 'В целом, ведение дневника мыслей через мобильное приложение может быть отличным способом развивать свою эмоциональную интеллектуальность и повышать уровень самосознания. Через анализ своих мыслей и эмоций можно научиться принимать более здоровые и позитивные решения и улучшать свое общее благополучие.', style: TextStyle( fontSize: 24, color: Colors.white, ), ), SizedBox(height: 16), Positioned( bottom: 0, left: 0, right: 0, child: PreferredSize( preferredSize: Size.fromHeight(appBarHeight), child: BottomAppBar( color: Colors.purple, child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [ IconButton( onPressed: () { Navigator.push( context, MaterialPageRoute(builder: (context) => Menu1()), ); }, icon: Icon( Icons.home_filled, color: Colors.white, ), ), IconButton( onPressed: () { Navigator.push( context, MaterialPageRoute(builder: (context) => TestsScreen()), ); }, icon: Icon( Icons.ad_units_sharp, color: Colors.white, ), ), IconButton( onPressed: () { Navigator.push( context, MaterialPageRoute(builder: (context) => LitScreen()), ); }, icon: Icon( Icons.collections_bookmark, color: Colors.white, ), ), IconButton( onPressed: () { Navigator.push( context, MaterialPageRoute(builder: (context) => UserInfoScreen(user: FirebaseAuth.instance.currentUser!)), ); }, icon: Icon( Icons.account_circle, color: Colors.white, ), ), ], ), ), ), ), ], ), ), ), ); } }