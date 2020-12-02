import 'package:flutter/material.dart';

Color color11;
Color _color2;
double imageSize;

class Background extends StatelessWidget {
  final Color color1;
  final Color color2;
  const Background({Key key, this.color1, this.color2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    imageSize = MediaQuery.of(context).size.height * 0.20;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Background',
      home: Scaffold(
        //appBar: AppBar(
        //title: Text('Prueba CustomP'),
        //),
        body: CustomPAnimated1(
          color1: color1,
          color2: color2,
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Color> colorG;
  final List<double> stopsG;
  const MyPainter(this.colorG, this.stopsG);
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = new Paint()
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: colorG,
        stops: stopsG,
      ).createShader(rect);
    //..color = Color(0xff21232a);
    //..style = PaintingStyle.stroke
    //..strokeWidth = 5
    //..strokeCap = StrokeCap.round;
    //paint.color = Color(0xFF21232a);
    final path = new Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.30, size.height, size.width * 0.35, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.45,
        size.width * 0.55, size.height * 0.45);
    path.quadraticBezierTo(size.width, size.height * 0.50, size.width, 0.0);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}

class MyPainter2 extends CustomPainter {
  final List<Color> colorG;
  final List<double> stopsG;
  const MyPainter2(this.colorG, this.stopsG);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = new Paint()
      //..color = Color(0xff21232a)
      //..style = PaintingStyle.stroke
      //..strokeWidth = 5
      //..strokeCap = StrokeCap.round;
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: colorG,
        stops: stopsG,
      ).createShader(rect);

    final path = new Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width * 0.20, 0.0, 0.0, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyPainter2 oldDelegate) => true;
}

class CustomPAnimated1 extends StatefulWidget {
  final Color color1;
  final Color color2;
  const CustomPAnimated1({Key key, this.color1, this.color2}) : super(key: key);
  @override
  _CustomPAnimated1State createState() => _CustomPAnimated1State();
}

class _CustomPAnimated1State extends State<CustomPAnimated1>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    //alignment: Alignment.topLeft,
                    height: imageSize + (10 * _controller.value),
                    width: imageSize + (10 * _controller.value),
                    //color: Colors.black12,
                    child: CustomPaint(
                      painter: MyPainter(
                          [widget.color1, widget.color2, widget.color1],
                          [0.0, _controller.value, 1.0]),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    (2 * (imageSize + (10 * _controller.value))),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    //alignment: new Alignment.bottomRight,
                    height: imageSize + (10 * _controller.value),
                    width: imageSize + (10 * _controller.value),
                    //color: Colors.black12,
                    child: CustomPaint(
                      painter: MyPainter2(
                          [widget.color1, widget.color2, widget.color1],
                          [0.0, _controller.value, 1.0]),
                    )),
              )
            ],
          );
        });
  }
}
