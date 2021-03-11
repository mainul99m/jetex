import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  const AuthButton({Key key, this.onPressed, @required this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: RaisedButton(
        color: color,
        shape: StadiumBorder(),
        child: child,
        onPressed: onPressed
      ),
    );
  }
}
