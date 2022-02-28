import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
// import 'package:sky_engine/_http/http.dart' as http;

class showDatapage extends StatefulWidget {
  const showDatapage({ Key? key }) : super(key: key);

  @override
  State<showDatapage> createState() => _showDatapageState();
}

class _showDatapageState extends State<showDatapage> {

  List<String>? scannedData = [];

  showData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      scannedData = prefs.getStringList('data')!;  
    }); 
  }

  @override
  void initState() {
    super.initState();
    showData();
  }

  //@override
  // void postData(String title) async {
  //   var response = await http.post(
  //     Uri.parse('http://localhost:1337/api/articles'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode({
  //       'data': {'title': "$title"},
  //     }),
  //   );
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Show Data')),
      ),
      body: Center(
        child: Text(scannedData!.toString()),
        // child: ListView.builder(
        //   itemCount: 2,
        //   itemBuilder: (context, i) => ListTile(
        //     title: Text("scannedData![i]"),
        //   ),
        // ),
      ),
      
    );
  }
}