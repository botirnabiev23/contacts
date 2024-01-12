import 'package:contacts/pages/add_new_contract_page.dart';
import 'package:contacts/pages/contact_info_page.dart';
import 'package:contacts/utells/utells.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  Faker faker = Faker();
  List<Contact> contacts = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const AddNewContactPage();
            }),
          );
          if (result is Contact) {
            contacts.add(result);
            setState(() {});
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: contacts.isEmpty
          ? const Center(
              child: Text('There is no any contacts'),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 60),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ContactInfoPage(
                            contact: contact,
                          );
                        },
                      ),
                    );
                  },
                  trailing: IconButton(
                    onPressed: () {
                      contacts.removeWhere(
                          (element) => element.firstName == contact.firstName);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: getColor(contact.color),
                    foregroundColor: getTextColor(contact.color),
                    child: Text(contact.firstName[0]),
                  ),
                  title: Text('${contact.firstName} ${contact.lastName}'),
                  subtitle: Text(contact.phone1),
                );
              },
            ),
    );
  }
}
