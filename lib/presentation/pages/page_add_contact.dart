import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serce/data/repository.dart';
import 'package:serce/domain/repository.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final RepositoryImpl _repo = Get.find();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Täze kontakt")),
        body: Column(
          children: [Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              controller: phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Telefon',
              ),
            ),
          ),
          ElevatedButton(onPressed: () async {
             final r = await _repo.postRoom(PostRoomDto(phone: phone.text));
             if (r.value != null) {
               Get.back(result: 1);
             }
          }, child: const Text("Goş"))],
        ));
  }
}
