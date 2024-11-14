import 'package:flutter/material.dart';
import 'package:mbtiapp/startpage.dart';

class Detailpage extends StatefulWidget {
  final String question;
  final String answer;
  const Detailpage({super.key, required this.question, required this.answer});

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
            Text(widget.question),
            Text(widget.answer),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Startpage()),
                  );
                },
                child: Text('돌아가기'))
          ],
        ),
      ),
    );
  }
}
