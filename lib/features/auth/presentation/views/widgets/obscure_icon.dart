import 'package:flutter/material.dart';

class ObscureIcon extends StatefulWidget {
  bool obscureText;
  final VoidCallback onpressed;
  ObscureIcon({super.key, required this.obscureText, required this.onpressed});

  @override
  State<ObscureIcon> createState() => _ObscureIconState();
}

class _ObscureIconState extends State<ObscureIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.obscureText ? Icons.visibility : Icons.visibility_off,
        color: Colors.black,
      ),
      onPressed: widget.onpressed,
    );
  }
}
