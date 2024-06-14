import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serce/data/repository.dart';
import 'package:serce/domain/repository.dart';
import 'package:serce/presentation/pages/page_rooms.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final RepositoryImpl repo = Get.find();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Container(
                margin: const EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 0),
                child: TextField(
                  controller: nickname,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
              ElevatedButton(onPressed: () async {
                final r = await repo.postLogin(PostLoginDto(name: nickname.text, phone: password.text));
                if (r.value != null) Get.offAll(() => const RoomsPage());
              }, child: const Text("Enter"))
            ],
          ),
        ),
      ),
    );
  }
}