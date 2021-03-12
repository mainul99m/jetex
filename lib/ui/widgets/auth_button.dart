import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double height;
  final VoidCallback onPressed;

  const AuthButton({Key key, this.onPressed, @required this.color, this.height, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height == null ? 44 : height,
      child: RaisedButton(
        color: color,
        shape: StadiumBorder(),
        child: child,
        onPressed: onPressed
      ),
    );
  }
}
