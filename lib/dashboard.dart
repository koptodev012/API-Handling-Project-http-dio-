import 'package:api_integration_flutter/view/using%20dio/addData_dio_screen.dart';
import 'package:api_integration_flutter/view/using%20dio/deleteData_dio_screen.dart';
import 'package:api_integration_flutter/view/using%20dio/fetchingData_dio_screen.dart';
import 'package:api_integration_flutter/view/using%20dio/updateData_dio_screen.dart';
import 'package:api_integration_flutter/view/using%20htttp/addData_http_screen.dart';
import 'package:api_integration_flutter/view/using%20htttp/deleteData_http_screen.dart';
import 'package:api_integration_flutter/view/using%20htttp/fetchingData_http_screen.dart';
import 'package:api_integration_flutter/view/using%20htttp/updateData_http_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "API - Http",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(
                  "API - Dio",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      nav(AddDataHttp());
                    },
                    child: Text("ADD")),
                ElevatedButton(
                    onPressed: () {
                      nav(AddDataDio());
                    },
                    child: Text("ADD"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      nav(UpdateDataHttp());
                    },
                    child: Text("UPDATE")),
                ElevatedButton(
                    onPressed: () {
                      nav(UpdateDataDio());
                    },
                    child: Text("UPDATE"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      nav(DeleteDataHttp());
                    },
                    child: Text("DELETE")),
                ElevatedButton(
                    onPressed: () {
                      nav(DeleteDataDio());
                    },
                    child: Text("DELETE"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      nav(FetchingDataHttp());
                    },
                    child: Text("FETCH")),
                ElevatedButton(
                    onPressed: () {
                      nav(FetchingDataDio());
                    },
                    child: Text("FETCH"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
