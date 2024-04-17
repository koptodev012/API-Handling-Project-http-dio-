import 'dart:convert';
import 'package:api_integration_flutter/model/fetchData_user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchingDataHttp extends StatefulWidget {
  const FetchingDataHttp({super.key});

  @override
  State<FetchingDataHttp> createState() => _FetchingDataHttpState();
}

class _FetchingDataHttpState extends State<FetchingDataHttp> {
  // -------------------------------------------------------------

  List<UserModel> userData = [];
  
  Future<List<UserModel>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      data.forEach((i) => userData.add(UserModel.fromJson(i)));
      return userData;
    } else {
      return userData;
    }
  }

  // =============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Fetch user data - http"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: ListView.builder(
                    itemCount: userData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          height: 240,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "ID: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: userData[index].id.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ])),
                                Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Name: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: userData[index].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ])),
                                Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Email: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: userData[index].email.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ])),
                                Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Phone: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: userData[index].phone.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ])),
                                Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Website: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: userData[index].website.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ])),
                                Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Company Name: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: userData[index]
                                          .company
                                          .name
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ])),
                                Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Address: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          "${userData[index].address.suite.toString()}, ${userData[index].address.street.toString()}, ${userData[index].address.city.toString()} - ${userData[index].address.zipcode.toString()}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ]))
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
