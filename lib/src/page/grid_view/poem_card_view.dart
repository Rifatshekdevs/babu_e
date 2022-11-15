import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PoemcircleAnimation extends StatefulWidget {
  final Widget child;
  final bool play;
  const PoemcircleAnimation({
    Key? key,
    required this.size,
    required this.child,
    required this.play,
  }) : super(key: key);

  final Size size;

  @override
  State<PoemcircleAnimation> createState() => _PoemcircleAnimationState();
}

class _PoemcircleAnimationState extends State<PoemcircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3, milliseconds: 500),
    );
    animation = Tween(begin: 0.0, end: 0.8).animate(controller);
    controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.play) {
      return SizedBox(
        height: respectiveWidth(widget.size, 80),
        width: respectiveWidth(widget.size, 350),
        child: Container(
          //   width: respectiveWidth(widget.size, 150),
          //   height: respectiveHeight(widget.size, 150),
          margin: EdgeInsets.all(7.0),
          decoration: BoxDecoration(
              color: HexColor('#F8E2EE'),
              borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
            height: respectiveWidth(widget.size, 70),
            width: respectiveWidth(widget.size, 70),
            child: widget.child,
          ),
        ),
      );
    } else {
      return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SizedBox(
              height: respectiveWidth(widget.size, 80),
              width: respectiveWidth(widget.size, 350),
              child: Container(
                //   width: respectiveWidth(widget.size, 150),
                //   height: respectiveHeight(widget.size, 150),
                margin: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                   color: HexColor('#F8E2EE'),
              borderRadius: BorderRadius.circular(15),
              ),
                child: SizedBox(
                  height: respectiveWidth(widget.size, 70),
                  width: respectiveWidth(widget.size, 70),
                  child: widget.child,
                ),
              ),
            );
          });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class CardPainter extends CustomPainter {
  var value;
  CardPainter(
    this.value,
  );
  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    final paint = Paint();
    paint.color = colorLightPurple;
    paint..strokeWidth = 5;
    final paint2 = Paint();
    paint2..color = Color(0xFFdfe4ea);
    paint2..strokeWidth = 5;
    Offset center = Offset(size.height / 2, size.width / 2);
    Rect rect = Rect.fromCenter(
        center: center,
        width: size.width + (size.width * 0.20),
        height: size.height + (size.width * 0.20));
    //  Radius radius = Radius.circular(60);
    // RRect rrect = RRect.fromRectAndRadius(rect, radius);
    //   print(size.width);
    canvas.drawArc(rect, 0, 0.8, true, paint2);
    canvas.drawArc(rect, 1.25663704, 0.8, true, paint2);
    canvas.drawArc(rect, 2.51327408, 0.8, true, paint2);
    canvas.drawArc(rect, 3.7699111199999997, 0.8, true, paint2);
    canvas.drawArc(rect, 5.02654816, 0.8, true, paint2);

    canvas.drawArc(rect, 0, value, true, paint);
    canvas.drawArc(rect, 1.25663704, value, true, paint);
    canvas.drawArc(rect, 2.51327408, value, true, paint);
    canvas.drawArc(rect, 3.7699111199999997, value, true, paint);
    canvas.drawArc(rect, 5.02654816, value, true, paint);
    Paint paint3 = Paint();
    paint3..color = Color.fromARGB(255, 252, 244, 243);
    canvas.drawCircle(center, (size.width / 2) + 8, paint3);
    // canvas.drawRRect(rrect, paint);

//    canvas.drawArc(rect, 0, 90, true, paint);
    //   canvas.drawCircle(center, size.width / 2, paint);
    //canvas.drawLine(Offset(20, 20), Offset(150, 150), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
