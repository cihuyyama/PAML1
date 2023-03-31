import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';
import 'package:my_app/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  String? name;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukkan Nama',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                    },
                    onSaved: (value) {
                      name = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Masukkan Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      } else if (!value.contains("@")) {
                        return 'Format Email salah';
                      }
                    },
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Register'),
                    onPressed: () {
                      if (_formkey.currentState!.validate()){
                        _formkey.currentState!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              name: name,
                              email: email,
                            ),
                          )
                        );
                      }
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
