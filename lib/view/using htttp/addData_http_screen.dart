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
  final _formKey = GlobalKey<FormState>();

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
          title: Text("Add user data - Http",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.purple, Colors.blue])),
          )
          
          ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
              TextFormField(
                controller: jobController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Job is required";
                  }
                },
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
                    if (_formKey.currentState!.validate()) {
                      AddData();
                    }
                  },
                  child: Text("SAVE"))
            ],
          ),
        ),
      ),
    );
  }
}
