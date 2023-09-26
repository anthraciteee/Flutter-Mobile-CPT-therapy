import 'package:flutter/material.dart';

class SituationPage extends StatefulWidget {
  final VoidCallback onInfoPressed;
  final ValueChanged<String> onChanged;

  const SituationPage({Key? key, required this.onInfoPressed, required this.onChanged}) : super(key: key);

  static _SituationPageState of(BuildContext context) {
    final state = context.findAncestorStateOfType<_SituationPageState>();
    assert(state != null, 'SituationPage is not a descendant of the current context');
    return state!;
  }

  @override
  _SituationPageState createState() => _SituationPageState();
}

class _SituationPageState extends State<SituationPage> {
  late final TextEditingController _controller = TextEditingController(); // объявляем контроллер

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onChanged(_controller.text);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
            ),
          ),
        ),
        Positioned(
          top: 100.0,
          left: 16.0,
          right: 16.0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Событие / Ситуация / Триггер',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: widget.onInfoPressed,
                      icon: Icon(Icons.info_outline),
                      label: SizedBox.shrink(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _controller,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
  TextEditingController get controller => _controller;
}

class InfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.0,
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
              'Пояснение',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Определите ваши негативные мысли или эмоции. Триггером может быть совершенно незначительное событие или даже ваша собственная мысль.'
                  ' \n\nНапример: Я напортачил с задачей на работе ',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}