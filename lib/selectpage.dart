import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbtiapp/questionpage.dart';

class Selectpage extends StatelessWidget {
  Future<String> loadAssets() async {
    return await rootBundle.loadString('res/api/list.json');
  }

  const Selectpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('테스트'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<String>(
          future: loadAssets(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              Map<String, dynamic> list = jsonDecode(snapshot.data!);
              return ListView.builder(
                itemCount: list['count'],
                itemBuilder: (context, value) {
                  return InkWell(
                    onTap: () async {
                      await FirebaseAnalytics.instance
                          .logEvent(name: "test_click", parameters: {
                        "test_name":
                            list['questions'][value]['title'].toString(),
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Questionpage(
                                  question: list['questions'][value]['file']
                                      .toString(),
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          color: const Color.fromARGB(255, 255, 243, 254),
                          child: Center(
                            child: Text(
                              list['questions'][value]['title'].toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
