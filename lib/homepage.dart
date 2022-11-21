import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController editingController = TextEditingController();
  var adddata;
  var getData;
  var deletebtn;
  addData() async {
    final prefs = await SharedPreferences.getInstance();
    adddata = await prefs.setString("sazid", editingController.text);
    setState(() {});
  }

  @override
  void initState() {
    getdata();
    getData;
    // TODO: implement initState
    super.initState();
  }

  getdata() async {
    final prefs = await SharedPreferences.getInstance();
    getData = prefs.getString("sazid").toString();
    setState(() {});
  }

  deletedfctn() async {
    final prefs = await SharedPreferences.getInstance();
    deletebtn = await prefs.remove('sazid');
    setState(() {
      deletebtn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                hintText: "Welcome",
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              addData();
              getdata();
            },
            child: Text("Click"),
          ),
          Text("$getData"),
          TextButton(
              onPressed: () {
                setState(() {
                  deletedfctn();
                });
              },
              child: Text("Deleted")),
        ],
      ),
    );
  }
}
