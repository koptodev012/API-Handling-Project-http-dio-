import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UpdateDataDio extends StatefulWidget {
  const UpdateDataDio({super.key});

  @override
  State<UpdateDataDio> createState() => _UpdateDataDioState();
}

class _UpdateDataDioState extends State<UpdateDataDio> {
  // -------------------------------------------------

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var _number_tickets_total;

  void UpdateData() async {
    try {
      var dio = Dio();
      Response response = await dio
          .put("https://reqres.in/api/users/$_number_tickets_total", data: {
        "email": emailController.text,
        "first_name": firstnameController.text,
        "last_name": lastnameController.text,
      });
      var data = response.data;
      final snackBar = SnackBar(
        content: Text("Updated at - ${data['updatedAt']}"),
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
        title: Text("Update user data - dio"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextFormField(
            //   controller: idController,
            //   decoration: const InputDecoration(
            //     border: UnderlineInputBorder(),
            //     labelText: 'Id',
            //   ),
            // ),
            DropdownButton<int>(
                hint: Text("Select Id"),
                value: _number_tickets_total,
                items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
                  return new DropdownMenuItem<int>(
                    value: value,
                    child: new Text(value.toString()),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _number_tickets_total = val!;
                  });
                }),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      UpdateData();
                    },
                    child: Text("Update")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
