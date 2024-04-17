import 'package:api_integration_flutter/view/using%20dio/addData_dio_screen.dart';
import 'package:api_integration_flutter/view/using%20dio/deleteData_dio_screen.dart';
import 'package:api_integration_flutter/view/using%20dio/fetchingData_dio_screen.dart';
import 'package:api_integration_flutter/view/using%20dio/updateData_dio_screen.dart';
import 'package:api_integration_flutter/view/using%20htttp/addData_http_screen.dart';
import 'package:api_integration_flutter/view/using%20htttp/deleteData_http_screen.dart';
import 'package:api_integration_flutter/view/using%20htttp/fetchingData_http_screen.dart';
import 'package:api_integration_flutter/view/using%20htttp/updateData_http_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // ----------------------------------
    void nav(var pagename) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => pagename));
    }
    // ==================================

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard"),
      //   backgroundColor: Colors.amber,
      // ),
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.blue],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "API - Http",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      nav(const AddDataHttp());
                    },
                    child: const Text("ADD")),
                ElevatedButton(
                    onPressed: () {
                      nav(const UpdateDataHttp());
                    },
                    child: const Text("UPDATE")),
                ElevatedButton(
                    onPressed: () {
                      nav(const DeleteDataHttp());
                    },
                    child: const Text("DELETE")),
                ElevatedButton(
                    onPressed: () {
                      nav(const FetchingDataHttp());
                    },
                    child: const Text("FETCH")),
              ],
            ),
            Column(
              children: [
                const Text(
                  "API - Dio",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      nav(const AddDataDio());
                    },
                    child: const Text("ADD")),
                ElevatedButton(
                    onPressed: () {
                      nav(const UpdateDataDio());
                    },
                    child: const Text("UPDATE")),
                ElevatedButton(
                    onPressed: () {
                      nav(const DeleteDataDio());
                    },
                    child: const Text("DELETE")),
                ElevatedButton(
                    onPressed: () {
                      nav(const FetchingDataDio());
                    },
                    child: const Text("FETCH"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
