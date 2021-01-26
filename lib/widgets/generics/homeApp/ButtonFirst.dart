import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:flutter/cupertino.dart';

class ButtonFirst extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final Color color1;
  final Color color2;
  final Color colorText1;
  final Color colorText2;

  const ButtonFirst(
      {Key key,
      this.color1,
      this.color2,
      this.title,
      this.onTap,
      this.colorText1,
      this.colorText2})
      : super(key: key);

  @override
  _ButtonFirstState createState() => _ButtonFirstState();
}

class _ButtonFirstState extends State<ButtonFirst> {
  bool _tapInProgress = false;

  get colorText => null;

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
          height: 65.0,
          margin: EdgeInsets.only(top: 12, bottom: 12),
          decoration: BoxDecoration(
              color: _tapInProgress ? widget.color2 : widget.color1,
              borderRadius: BorderRadius.circular(35),
              /*boxShadow: [
                BoxShadow(
                    color: widget.color1,
                    offset: new Offset(2.0, 2.0),
                    blurRadius: _tapInProgress ? 10.0 : _blurRadius)
              ]*/),
          child: Center(
              child: Text(
            widget.title,
            style: TextStyle(
              color: _tapInProgress ? widget.colorText2 : widget.colorText1,
              fontFamily: fontApp,
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
            ),
          ))),
      onTap: widget.onTap,
      onTapUp: _tapUp,
      onTapDown: _tapDown,
      onTapCancel: _tapToCancel,
    );
  }
}
