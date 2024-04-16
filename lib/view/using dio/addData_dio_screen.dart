import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddDataDio extends StatefulWidget {
  const AddDataDio({super.key});

  @override
  State<AddDataDio> createState() => _AddDataDioState();
}

class _AddDataDioState extends State<AddDataDio> {
  // -----------------------------------------------

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  void AddData() async {
    try {
      var dio = Dio();
      Response response = await dio.post("https://reqres.in/api/users", data: {
        "name": nameController.text,
        "job": jobController.text,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final snackBar = SnackBar(
          content: const Text('Saved!'),
          action: SnackBarAction(
            label: '',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        nameController.text = "";
        jobController.text = "";
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: const Text('Failed!'),
        action: SnackBarAction(
          label: '',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    jobController.dispose();

    super.dispose();
  }

  // ===============================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add user data - dio"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            TextFormField(
              controller: jobController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your job',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  AddData();
                },
                child: Text("SAVE"))
          ],
        ),
      ),
    );
  }
}