import 'package:contacts/models/contact.dart';
import 'package:contacts/utells/utells.dart';
import 'package:flutter/material.dart';

class AddNewContactPage extends StatefulWidget {
  const AddNewContactPage({super.key});

  @override
  State<AddNewContactPage> createState() => _AddNewContactPageState();
}

class _AddNewContactPageState extends State<AddNewContactPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phone1Controller = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new contact'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 60,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (firstNameController.text.isEmpty) {
                    return 'First Name must containt at least 1 chars';
                  } else {
                    return null;
                  }
                },
                controller: firstNameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: lastNameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (phone1Controller.text.length < 9) {
                    return 'Enter at least 9 chars.';
                  } else {
                    return null;
                  }
                },
                controller: phone1Controller,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone number 1',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: phone2Controller,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone number 2',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 46),
                ),
                onPressed: () {
                  final valid = formKey.currentState!.validate();
                  if (valid == true) {
                    final contact = Contact(
                      firstName: firstNameController.text,
                      phone1: phone1Controller.text,
                      color: getRandomColorName(),
                    );
                    contact.phone2 = phone2Controller.text;
                    contact.lastName = lastNameController.text;

                    Navigator.of(context).pop(contact);
                  }
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 46),
                  foregroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
