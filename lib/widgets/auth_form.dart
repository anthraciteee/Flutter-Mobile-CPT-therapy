import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/introinfo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/screens/user_info_screen.dart';

class AuthForm extends StatefulWidget {
  AuthForm({
    Key? key,
    required this.onAuth,
    required this.authButtonText,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final VoidCallback onAuth;
  final String authButtonText;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? user;

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }
      // получаем учетные данные Google
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // создаем учетную запись Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // входим в Firebase
      final User user = (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
      setState(() {
        this.user = user;
      });

      // перенаправляем пользователя на экран UserInfoScreen
      final NavigatorState navigator = Navigator.of(context);
      navigator.pushReplacement(MaterialPageRoute(builder: (_) => IntroInfoScreen()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      TextFormField(
      controller: widget.emailController,
      decoration: InputDecoration(
        labelText: 'Электронная почта',
        prefixIcon: Icon(Icons.email), // добавляем иконку перед полем электронной почты
      ),
    ),
    TextFormField(
    controller: widget.passwordController,
    decoration: InputDecoration(
    labelText: 'Пароль',
    prefixIcon: Icon(Icons.lock), // добавляем иконку перед полем пароля
    ),
    obscureText: true,
    ),
    const SizedBox(height: 16.0),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: Colors.purple, // изменяем цвет фона на фиолетовый
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    ),
    child: Text(widget.authButtonText),
    onPressed: widget.onAuth,
    ),
    const SizedBox(height: 16.0),
    ElevatedButton.icon(
    icon: Image.network(
    'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-32.png'),
    label: const Text('Sign in with Google'), onPressed: () => signInWithGoogle(context),
    ),
      ],
        );
           }
            }