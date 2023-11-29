import 'package:flutter/material.dart';

class SlidableWidget extends StatefulWidget {
  final Widget child;

  final VoidCallback onSlided;
  final double actionThreshold;

  const SlidableWidget({
    required this.child,
    required this.onSlided,
    this.actionThreshold = 0.1,
    Key? key,
  }) : super(key: key);

  @override
  _SlidableWidgetState createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _dragExtent = 0;
  Size size = Size(0, 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onHorizontalDragStart: onDragStart,
        onHorizontalDragUpdate: onDragUpdate,
        onHorizontalDragEnd: onDragEnd,
        child: Stack(
          children: [
            SizedBox(
              // child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(16)),
              //       color: Colors.black.withOpacity(0.2),
              //     ),
              //     padding: EdgeInsets.only(right: 17),
              //     alignment: Alignment.centerRight,
              //     child: Container(
              //       height: _controller.value * 200,
              //       color: Colors.red,
              //       width: _controller.value * 300,
              //       child: Image(
              //         image: AssetImage('assets/Images/SwipeLeft-unscreen.gif'),
              //         height: _controller.value * 200,
              //         fit:BoxFit.fill,
              //         color: Colors.black,
              //         width: _controller.value * 300,
              //       ),
              //     )),
              // width: size.width,
              // height: size.height,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => SlideTransition(
                position: AlwaysStoppedAnimation(Offset(-_controller.value, 0)),
                child: widget.child,
              ),
            ),
          ],
        ),
      );

  void onDragStart(DragStartDetails details) {
    setState(() {
      size = context.size!;
      _dragExtent = 0;
      _controller.reset();
    });
  }

  void onDragUpdate(DragUpdateDetails details) {
    _dragExtent += details.primaryDelta!;
    if (_dragExtent >= 0) {
      return;
    }

    setState(() {
      _controller.value = _dragExtent.abs() / context.size!.width;
    });
  }

  void onDragEnd(DragEndDetails details) {
    if (_controller.value > widget.actionThreshold) {
      widget.onSlided();
    }

    _controller.fling(velocity: -1.5);
  }
}
