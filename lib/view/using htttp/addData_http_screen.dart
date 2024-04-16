import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AddDataHttp extends StatefulWidget {
  const AddDataHttp({super.key});

  @override
  State<AddDataHttp> createState() => _AddDataHttpState();
}

class _AddDataHttpState extends State<AddDataHttp> {
  // -------------------------------------------------

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  void AddData() async {
    try {
      Response response = await http.post(
        Uri.parse("https://reqres.in/api/users"),
        body: {
          "name": nameController.text,
          "job": jobController.text,
        },
      );

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

  // =================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add user data - http"),
        backgroundColor: Colors.blueAccent,
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