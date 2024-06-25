import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function tap;
  final Color titleColor;

  VerticalIconButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.tap,
      required this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        tap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            title,
            style: TextStyle(color: titleColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
