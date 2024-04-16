import 'package:api_integration_flutter/view/using%20dio/fetchingData_dio_screen.dart';
import 'package:api_integration_flutter/view/using%20htttp/fetchingData_http_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FetchingDataDio(),
    );
  }
}
