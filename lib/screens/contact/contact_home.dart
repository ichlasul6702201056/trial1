import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './contact.dart';

class ContactHome extends StatefulWidget {
  const ContactHome({Key? key}) : super(key: key);

  @override
  _ContactHomeState createState() => _ContactHomeState();
}

class _ContactHomeState extends State<ContactHome> {
  final CollectionReference _contactsCollection =
      FirebaseFirestore.instance.collection('phone');

  // Text controllers for the form
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Function to add a new contact
  Future<void> _addContact() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              // Add the contact to Firestore
              await _contactsCollection.add({
                'name': _nameController.text,
                'phone': _phoneController.text,
              });

              // Clear the text fields
              _nameController.clear();
              _phoneController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  // Function to update an existing contact
  Future<void> _updateContact(Contact contact) async {
    _nameController.text = contact.name;
    _phoneController.text = contact.phoneNumber;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              // Update the contact in Firestore
              await _contactsCollection.doc(contact.id).update({
                'name': _nameController.text,
                'phone': _phoneController.text,
              });

              // Clear the text fields
              _nameController.clear();
              _phoneController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  // Function to delete a contact
  Future<void> _deleteContact(String contactId) async {
    await _contactsCollection.doc(contactId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _contactsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No contacts found.'));
          }

          final contacts = snapshot.data!.docs
              .map((doc) =>
                  Contact.fromMap(doc.data() as Map<String, dynamic>, doc.id))
              .toList();

          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return ListTile(
                title: Text(
                  contact.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                subtitle: Text(
                  contact.phoneNumber,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _updateContact(contact),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteContact(contact.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      // Floating Action Button (FAB) for adding a new contact
      floatingActionButton: FloatingActionButton(
        onPressed: _addContact,
        child: const Icon(Icons.add),
      ),
    );
  }
}
