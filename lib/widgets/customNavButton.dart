import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CircleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/trip');
        },
        icon: Icon(
          Icons.travel_explore,
          size: 40,
        ),
        color: Colors.white,
      ),
    );
  }
}

class CustomNavButton extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const CustomNavButton({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomNavButton> createState() => _CustomNavButtonState();
}

class _CustomNavButtonState extends State<CustomNavButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(72, 255, 70, 70),
                      spreadRadius: -5,
                      blurRadius: 7,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                height: 70,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, (MediaQuery.of(context).size.width * 0.2850467289719626).toDouble()),
                  painter: RPSCustomPainter(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                widget.onItemTapped(0);
                                Navigator.pushNamed(context, '/beranda');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: widget.selectedIndex == 0 ? Theme.of(context).primaryColor : Colors.grey,
                                    size: 30,
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.onItemTapped(1);
                                Navigator.pushNamed(context, '/favorit');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: widget.selectedIndex == 1 ? Theme.of(context).primaryColor : Colors.grey,
                                    size: 30,
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.onItemTapped(2);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.my_library_books_outlined,
                                    color: widget.selectedIndex == 2 ? Theme.of(context).primaryColor : Colors.grey,
                                    size: 30,
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.onItemTapped(3);
                                Navigator.pushNamed(context, '/profil');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: widget.selectedIndex == 3 ? Theme.of(context).primaryColor : Colors.grey,
                                    size: 30,
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Center(child: CircleButton()),
          ),
        ]),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.6666667);
    path_0.cubicTo(size.width * 0.5591496, size.height * 0.6666667, size.width * 0.6084264, size.height * 0.4347295, size.width * 0.6192743, size.height * 0.1275590);
    path_0.cubicTo(size.width * 0.6217332, size.height * 0.05789192, size.width * 0.6326608, 0, size.width * 0.6464339, 0);
    path_0.lineTo(size.width * 0.9750623, 0);
    path_0.cubicTo(size.width * 0.9888354, 0, size.width, size.height * 0.05739936, size.width, size.height * 0.1282051);
    path_0.lineTo(size.width, size.height * 0.7820513);
    path_0.cubicTo(size.width, size.height * 0.8528564, size.width * 0.9888354, size.height * 0.9102564, size.width * 0.9750623, size.height * 0.9102564);
    path_0.lineTo(size.width * 0.02493763, size.height * 0.9102564);
    path_0.cubicTo(size.width * 0.01116494, size.height * 0.9102564, 0, size.height * 0.8528564, 0, size.height * 0.7820513);
    path_0.lineTo(0, size.height * 0.1282051);
    path_0.cubicTo(0, size.height * 0.05739936, size.width * 0.01116496, 0, size.width * 0.02493766, 0);
    path_0.lineTo(size.width * 0.3535661, 0);
    path_0.cubicTo(size.width * 0.3673392, 0, size.width * 0.3782668, size.height * 0.05789205, size.width * 0.3807257, size.height * 0.1275590);
    path_0.cubicTo(size.width * 0.3915736, size.height * 0.4347295, size.width * 0.4408504, size.height * 0.6666667, size.width * 0.5000000, size.height * 0.6666667);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xFFFFFFFF);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
