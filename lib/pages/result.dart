import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Result extends StatefulWidget {
  final String place;

  const Result({super.key, required this.place});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Future<Map<String, dynamic>> getDataFromAPI() async {
    final response = await http.get(Uri.parse(
        ("https://api.openweathermap.org/data/2.5/weather?q=${widget.place}&appid=035c9f27888c259afb0c5f53291485cd&units=metric")));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return data;
    } else {
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "hasil Tracking",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.red,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: FutureBuilder(
              future: getDataFromAPI(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LinearProgressIndicator();
                }
                if (snapshot.hasData) {
                  final data = snapshot.data!; // non nullable

                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: NetworkImage(
                                'https://flagsapi.com/${data["sys"]["country"]}/shiny/64.png')),
                        Text("Suhu : ${data["main"]["feels_like"]} C"),
                        Text("Kecepatan Angin : ${data["wind"]["speed"]} m/s"),
                        Text("Cuaca : ${data["weather"][0]["description"]}"),
                      ],
                    ),
                  );
                } else {
                  return const Text("tempat tidak di ketahui");
                }
              },
            ),
          )),
    );
  }
}
