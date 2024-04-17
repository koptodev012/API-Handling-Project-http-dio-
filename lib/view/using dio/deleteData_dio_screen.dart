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
  final _formKey = GlobalKey<FormState>();
  var _number_tickets_total;

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
          title: Text(
            "Delete user data - Dio",
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
            children: [
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
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_number_tickets_total == null) {
                      print("Please select");
                    } else {
                      DeleteData();
                    }
                  },
                  child: Text("Delete"))
            ],
          ),
        ),
      ),
    );
  }
}
