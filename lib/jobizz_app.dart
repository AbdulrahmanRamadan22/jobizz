import 'package:flutter/material.dart';

class JobizzApp extends StatelessWidget {
  const JobizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobizz App',
      theme: ThemeData(
        // fontFamily: 'Poppins',
      ),
      home: Scaffold(body: Center(child: Text("Jobizz App"))),
    );
  }
}
