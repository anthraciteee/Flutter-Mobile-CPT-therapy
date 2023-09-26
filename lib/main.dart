import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_service.dart';
import 'package:flutter_firebase/screens/auth_screen.dart';
import 'package:flutter_firebase/screens/intro_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_firebase/screens/introinfo.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();


class MyAppState extends ChangeNotifier {
  User? _user;

  MyAppState() {
    FirebaseService().onListenUser((user) {
      _user = user;
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
          kNavigatorKey.currentContext!,
          '/intro',
              (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          kNavigatorKey.currentContext!,
          '/menu1',
              (route) => false,
        );
      }
      notifyListeners();
    });
  }

  User? get user => _user;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: MaterialApp(
        navigatorKey: kNavigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<MyAppState>(
          builder: (context, state, _) {
            if (state.user == null) {
              return IntroScreen();
            } else {
              return IntroInfoScreen();
            }
          },
        ),
        routes: {
          '/intro': (context) => IntroInfoScreen(),
          '/auth': (context) => AuthScreen(),
          '/menu1': (context) => IntroInfoScreen(),
        },
      ),
    );
  }
}