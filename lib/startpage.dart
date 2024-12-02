import 'package:flutter/material.dart';

import 'package:mbtiapp/selectpage.dart';
import 'package:mbtiapp/user/join.dart';
import 'package:mbtiapp/user/signinPage.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                '재미있는 테스트',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Colors.indigo),
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
            OutlinedButton(
                style: OutlinedButton.styleFrom(shape: LinearBorder.bottom()),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signinpage()),
                  );
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                )),
            OutlinedButton(
                style: OutlinedButton.styleFrom(shape: LinearBorder.bottom()),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Join()),
                  );
                },
                child: Text(
                  '회원가입',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ))
          ],
        ),
      ),
    );
  }
}
