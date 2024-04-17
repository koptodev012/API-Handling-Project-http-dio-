import 'package:api_integration_flutter/model/fetchData_user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FetchingDataDio extends StatefulWidget {
  const FetchingDataDio({super.key});

  @override
  State<FetchingDataDio> createState() => _FetchingDataDioState();
}

class _FetchingDataDioState extends State<FetchingDataDio> {
  // -------------------------------------------------------------

  List<UserModel> userData = [];

  Future<List<UserModel>> getData() async {
    try {
      var dio = Dio();
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/users");
      var data = response.data;

      if (response.statusCode == 200) {
        data.forEach((i) => userData.add(UserModel.fromJson(i)));
        return userData;
      } else {
        return userData;
      }
    } catch (e) {
      print("error is  $e");
      return userData;
    }
  }
  // =============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Fetch user data - Dio",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.purple, Colors.blue])),
          )),
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
