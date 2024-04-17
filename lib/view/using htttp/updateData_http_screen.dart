import 'dart:convert';

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
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var _number_tickets_total;

  void UpdateData() async {
    try {
      Response response = await http.put(
        Uri.parse("https://reqres.in/api/users/$_number_tickets_total"),
        body: {
          "email": emailController.text,
          "first_name": firstnameController.text,
          "last_name": lastnameController.text,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
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
    print(_number_tickets_total);
    return Scaffold(
     appBar: AppBar(
          title: Text(
            "Update user data - Http",
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "First name is required";
                  }
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'First name',
                ),
              ),
              TextFormField(
                controller: lastnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Last name is required";
                  }
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Last name',
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                },
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
                        if (_formKey.currentState!.validate()) {
                          if (_number_tickets_total == null) {
                            print("Please select");
                          } else {
                            UpdateData();
                          }
                        }
                      },
                      child: Text("Update")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
