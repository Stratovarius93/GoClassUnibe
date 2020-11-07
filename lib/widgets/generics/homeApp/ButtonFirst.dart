import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class ButtonFirst extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final Color color1;
  final Color color2;
  const ButtonFirst({Key key, this.color1, this.color2, this.title, this.onTap})
      : super(key: key);

  @override
  _ButtonFirstState createState() => _ButtonFirstState();
}

class _ButtonFirstState extends State<ButtonFirst> {
  bool _tapInProgress = false;
  void _tapDown(TapDownDetails details) {
    setState(() {
      _tapInProgress = true;
    });
  }

  void _tapUp(TapUpDetails details) {
    setState(() {
      _tapInProgress = false;
    });
  }

  void _tapToCancel() {
    setState(() {
      _tapInProgress = false;
    });
  }

  void _onTap() {
    widget.onTap;
  }

  double _blurRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 60.0,
          width: (MediaQuery.of(context).size.width) * 0.55,
          decoration: BoxDecoration(
              color: _tapInProgress ? widget.color2 : widget.color1,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: widget.color1,
                    offset: new Offset(2.0, 2.0),
                    blurRadius: _tapInProgress ? 10.0 : _blurRadius)
              ]),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white, fontFamily: fontApp, fontSize: 20.0),
            ),
          )),
      onTap: widget.onTap,
      onTapUp: _tapUp,
      onTapDown: _tapDown,
      onTapCancel: _tapToCancel,
    );
  }
}
