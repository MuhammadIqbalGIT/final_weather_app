import 'package:final_weather_app/pages/result.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tracking cuaca",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  cursorColor: Colors.red,
                  decoration: const InputDecoration(
                      hintText: "ex : Jakarta",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      )),
                  controller: placeController,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Result(place: placeController.text);
                    }));
                    print(placeController.text);
                  },
                  child: const Text(
                    "Track",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 80),
                Container(
                  padding: const EdgeInsets.all(8.00),
                  color: Colors.red,
                  child: const Column(
                    children: [
                      Text("Kelompok Odoo",
                          style: TextStyle(color: Colors.white,fontSize: 20.0)),
                      Text("Aqil Muhammad Faqih",
                          style: TextStyle(color: Colors.white)),
                      Text("Dhaffa Satria Pratama",
                          style: TextStyle(color: Colors.white)),
                      Text("Muhammad Iqbal",
                          style: TextStyle(color: Colors.white)),
                      Text("Yulian Dewantara",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
