import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbtiapp/detailpage.dart';

class Questionpage extends StatefulWidget {
  final String question;
  const Questionpage({super.key, required this.question});

  @override
  State<Questionpage> createState() => _QuestionpageState();
}

class _QuestionpageState extends State<Questionpage> {
  String title = '';
  int counter = -1;

  Future<String> loadAssets(String fileName) async {
    return await rootBundle.loadString('res/api/$fileName.json');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadAssets(widget.question),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.hasError}');
          } else {
            Map<String, dynamic> questions = jsonDecode(snapshot.data!);
            title = questions['title'].toString();
            List<Widget> widgets;
            widgets = List<Widget>.generate(
                (questions['selects'] as List<dynamic>).length,
                (int index) => SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Text(questions['selects'][index]),
                          Radio(
                              value: index,
                              groupValue: counter,
                              onChanged: (value) {
                                setState(() {
                                  counter = index;
                                });
                              }),
                        ],
                      ),
                    ));
            return Scaffold(
                appBar: AppBar(
                  title: Text(title),
                ),
                body: Column(
                  children: [
                    Text(questions['title'].toString()),
                    Expanded(
                      child: ListView.builder(
                          itemCount: widgets.length,
                          itemBuilder: (context, index) {
                            final item = widgets[index];
                            return item;
                          }),
                    ),
                    counter == -1
                        ? Container()
                        : ElevatedButton(
                            onPressed: () async {
                              await FirebaseAnalytics.instance.logEvent(
                                name: "personal_select",
                                parameters: {
                                  "test_name": title,
                                  "selet": counter
                                },
                              ).then((result) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return Detailpage(
                                    queston: questions['question'],
                                    answer: questions['answer'][counter],
                                  );
                                }));
                              });
                            },
                            child: Text('성격보기'))
                  ],
                ));
          }
        });
  }
}
