library colored_icon_button;

import 'package:flutter/material.dart';

class ColoredIconButton extends StatefulWidget {
  final Icon icon;

  const ColoredIconButton({
    Key key,
    this.icon,
  })  : assert(icon != null),
        super(key: key);
  @override
  _ColoredIconButtonState createState() => _ColoredIconButtonState();
}

class _ColoredIconButtonState extends State<ColoredIconButton> {
  bool isLabelVisible = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedOpacity(
          opacity: isLabelVisible ? 1.0 : 0.0,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 200),
          child: Container(
            margin: EdgeInsets.only(right: 2, bottom: 5),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Text("Hello"),
          ),
        ),
        GestureDetector(
          onLongPressStart: (event) {
            setState(() => isLabelVisible = true);
          },
          onLongPressEnd: (event) {
            setState(() => isLabelVisible = false);
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                        isLabelVisible ? -2 : 2, isLabelVisible ? -2 : 2),
                    blurRadius: isLabelVisible ? 4 : 2,
                    spreadRadius: isLabelVisible ? -1 : 1,
                  ),
                ],
              ),
              child: IconButton(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                icon: widget.icon,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
