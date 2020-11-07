import 'package:flutter/material.dart';

class ButtonFirst extends StatefulWidget {
	String _titleButton;
	Function _function;
	Color _color1;
	Color _color2;

	ButtonFirst(this._titleButton, this._function, this._color1, this._color2);
	@override
	_ButtonFirstState createState() => _ButtonFirstState();
}

class _ButtonFirstState extends State<ButtonFirst> {
	bool _tapInProgress=false;
	void _tapDown(TapDownDetails details){
		setState(() {
			_tapInProgress = true;
		});
	}

	void _tapUp(TapUpDetails details){
		setState(() {
			_tapInProgress = false;
		});
	}

	void _tapToCancel(){
		setState(() {
			_tapInProgress = false;
		});
	}

	void _onTap(){
		widget._function;
	}
	double _blurRadius = 0.0;

	@override
	Widget build(BuildContext context) {
		return GestureDetector( 
				child: Container(
						height: 60.0,
						width: (MediaQuery.of(context).size.width)*0.55,
						decoration: BoxDecoration(
								color: _tapInProgress? widget._color2:widget._color1,
								borderRadius: BorderRadius.circular(30),
								boxShadow:[
									BoxShadow(
											color: widget._color1,
											offset: new Offset(2.0,2.0),
											blurRadius:_tapInProgress? 10.0:_blurRadius 
									)
								]),
						child: Center(
								child:Text(widget._titleButton, style: TextStyle(
												color: Colors.white,
												fontFamily: 'Raleway',
												fontSize: 20.0
								),),)
				),
		onTap: widget._function,
		onTapUp: _tapUp,
		onTapDown: _tapDown,
		onTapCancel: _tapToCancel,
		);
	}
}
