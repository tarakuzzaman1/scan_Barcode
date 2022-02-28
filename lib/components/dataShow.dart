
import 'package:flutter/material.dart';
import 'package:task/screens/showData.dart';

class dataShow extends StatelessWidget {
  const dataShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => showDatapage())
        );
      }, 
      child: Text('show data'),
    );
  }
}