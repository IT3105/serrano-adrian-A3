import 'package:flutter/material.dart';
import 'package:contact_list/utils/contact_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  List contactList = [
    ['Adrian Ray Serrano', 'handsome@gmail.com', '09959163519'],
    ['Mythanielle Canton', 'cantonmythanielle@gmail.com', '09458832468'],
    ['Cyrus Gwapo', 'cyrusIgop@gmail.com', '09224567890'],
    ['Kyle T', 'kyledomainGODS@gmail.com', '09123456789'],
  ];

  int? _editingIndex;

  void saveContact() {
    setState(() {
      if (_editingIndex == null) {
        contactList.add([
          _nameController.text,
          _emailController.text,
          _phoneController.text,
        ]);
      } else {
        contactList[_editingIndex!] = [
          _nameController.text,
          _emailController.text,
          _phoneController.text,
        ];
        _editingIndex = null;
      }

      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
    });
  }

  void editContact(int index) {
    setState(() {
      _editingIndex = index;
      _nameController.text = contactList[index][0];
      _emailController.text = contactList[index][1];
      _phoneController.text = contactList[index][2];
    });
  }

  void deleteContact(int index) {
    setState(() {
      contactList.removeAt(index);
      if (_editingIndex == index) _editingIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC2FFC7), // Light Greenish background
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF62825D), // Olive Green header
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: contactList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ContactList(
                          name: contactList[index][0],
                          email: contactList[index][1],
                          phone: contactList[index][2],
                          deleteFunction: (context) => deleteContact(index),
                          editFunction: () => editContact(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              buildInputFields(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputFields() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _nameController,
            decoration: inputDecoration('Name'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _emailController,
            decoration: inputDecoration('Email'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _phoneController,
            decoration: inputDecoration('Phone'),
          ),
        ),
        FloatingActionButton(
          onPressed: saveContact,
          backgroundColor: const Color(0xFF9EDF9C), // Muted Green button
          child: const Icon(Icons.save),
        ),
      ],
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFF9EDF9C), // Muted Green input background
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF62825D)), // Olive Green border
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF62825D)), // Olive Green border
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
