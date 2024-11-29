import 'package:flutter/material.dart';
import 'package:mbtiapp/login/sample_screen.dart';
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
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                '재미있는 테스트',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            Spacer(),
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
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SampleScreen()),
                  );
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
