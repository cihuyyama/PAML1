import 'package:flutter/material.dart';
import 'package:my_app/detail_page.dart';
import 'package:my_app/register_page.dart';

class LoginPage extends StatelessWidget{
  LoginPage({super.key});

  String name = "Casemiro";


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: const Text("Push"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(),
                  ),
                );
              },
              child: const Text("PushReplacement"),
            )
          ],
        ),
      ),
    );
  }
}