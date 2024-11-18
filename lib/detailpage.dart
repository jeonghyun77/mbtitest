import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  final String queston;
  final String answer;
  const Detailpage({super.key, required this.queston, required this.answer});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.queston),
            Text(widget.answer),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('돌아가기'))
          ],
        ),
      ),
    );
  }
}
