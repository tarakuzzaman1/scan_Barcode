import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/dataShow.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String scannedData = '';
  String data = "";
  scan() async { 
    await FlutterBarcodeScanner.scanBarcode(
      "#000000", 
      "CANCEL", 
      true, 
      ScanMode.BARCODE
    ).then((value) => setState(() => data = value.toString()));
  }

  saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? old_data_list = [];
    old_data_list = prefs.getStringList('data');
    // if(old_data_list!.length != 0){
    //   old_data_list.add(data);
    // }
    // else {
    //   old_data_list = [data];
    // }
    // var data_to_save = await prefs.setStringList('data', old_data_list);
    print(old_data_list.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'barcode scanner',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('save data')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: ElevatedButton.icon(
                  onPressed: () => scan(), 
                  icon: Icon(Icons.camera), 
                  label: Text('Scan Your Code')
                ),
              ),

              Text(data,style: TextStyle(fontSize: 22.0),),

              ElevatedButton(
                onPressed: ()=>saveData(), 
                child: Text('Save'),
              ),
              dataShow()
            ],
          ),
        ),
      ),
    );
  }
}
