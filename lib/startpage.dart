import 'package:flutter/material.dart';
import 'package:mbtiapp/selectpage.dart';

class Startpage extends StatelessWidget {
  const Startpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 300,
            height: 120,
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: Text(
              '재미있는 테스트',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            '👤',
            style: TextStyle(fontSize: 100),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Selectpage()),
                );
              },
              child: Text(
                '시작하기',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          Spacer(),
        ],
      ),
    );
  }
}
