import 'package:flutter/material.dart';

class FaithLevelPage extends StatefulWidget {
  final double faithLevel;
  final ValueChanged<double> onFaithLevelChanged;

  FaithLevelPage({
    required this.faithLevel,
    required this.onFaithLevelChanged,
  });

  @override
  _FaithLevelPageState createState() => _FaithLevelPageState();
}

class _FaithLevelPageState extends State<FaithLevelPage> {
  double _faithLevel = 0.0;

  @override
  void initState() {
    super.initState();
    _faithLevel = widget.faithLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4B0082), Color(0xFFDA70D6)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 140.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                _faithLevel.toStringAsFixed(0),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                ),
                child: Slider(
                  value: _faithLevel,
                  onChanged: (value) {
                    setState(() {
                      _faithLevel = value;
                    });
                    widget.onFaithLevelChanged(value);
                  },
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150.0),
                child: Text(
                  'Оцените насколько высока ваша уверенность в правдивости автоматической мысли.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}