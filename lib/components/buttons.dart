import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String txt;
  const Button({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
          onPressed: () {  },
          child: Text(txt,),
        ),
    );
  }
}
