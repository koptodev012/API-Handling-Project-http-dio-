import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UpdateDataHttp extends StatefulWidget {
  const UpdateDataHttp({super.key});

  @override
  State<UpdateDataHttp> createState() => _UpdateDataHttpState();
}

class _UpdateDataHttpState extends State<UpdateDataHttp> {
  // -------------------------------------------------

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void UpdateData() async {
    try {
      Response response = await http.put(
        Uri.parse("https://reqres.in/api/users/${idController.text}"),
        body: {
          "email": emailController.text,
          "first_name": firstnameController.text,
          "last_name": lastnameController.text,
        },
      );

      if (response.statusCode == 200) {
        final snackBar = SnackBar(
          content: const Text('Update!'),
          action: SnackBarAction(
            label: '',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        idController.text = "";
        emailController.text = "";
        firstnameController.text = "";
        lastnameController.text = "";
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
    emailController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();

    super.dispose();
  }

  // =================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update user data - http"),
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
                labelText: 'Id',
              ),
            ),
            TextFormField(
              controller: firstnameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'First name',
              ),
            ),
            TextFormField(
              controller: lastnameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Last name',
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  UpdateData();
                },
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
