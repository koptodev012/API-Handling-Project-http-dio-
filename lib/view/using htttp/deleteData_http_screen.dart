import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DeleteDataHttp extends StatefulWidget {
  const DeleteDataHttp({super.key});

  @override
  State<DeleteDataHttp> createState() => _DeleteDataHttpState();
}

class _DeleteDataHttpState extends State<DeleteDataHttp> {
  // -------------------------------------------------

  TextEditingController idController = TextEditingController();

  void DeleteData() async {
    try {
      Response response = await http.delete(
        Uri.parse("https://reqres.in/api/users/${idController.text}"),
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
        title: Text("Delete user data - http"),
        backgroundColor: Colors.blueAccent,
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
