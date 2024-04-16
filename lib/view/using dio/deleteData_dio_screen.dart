import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DeleteDataDio extends StatefulWidget {
  const DeleteDataDio({super.key});

  @override
  State<DeleteDataDio> createState() => _DeleteDataDioState();
}

class _DeleteDataDioState extends State<DeleteDataDio> {
  // -------------------------------------------------

  TextEditingController idController = TextEditingController();

  void DeleteData() async {
    try {
      var dio = Dio();
      Response response = await dio.delete(
        "https://reqres.in/api/users/${idController.text}",
      );

      if (response.statusCode == 204) {
        final snackBar = SnackBar(
          content: const Text('Deleted!'),
          action: SnackBarAction(
            label: '',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        idController.text = "";
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
    idController.dispose();

    super.dispose();
  }

  // =================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete user data - dio"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter Id',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  DeleteData();
                },
                child: Text("Delete"))
          ],
        ),
      ),
    );
  }
}
