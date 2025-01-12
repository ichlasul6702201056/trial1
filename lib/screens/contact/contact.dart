class Contact {
  final String id;
  final String name;
  final String phoneNumber;

  Contact({required this.id, required this.name, required this.phoneNumber});

  factory Contact.fromMap(Map<String, dynamic> data, String documentId) {
    return Contact(
      id: documentId,
      name: data['name'] ?? '',
      phoneNumber: data['phone'] ?? '',
    );
  }

  // Optional: Convert Contact object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phoneNumber,
    };
  }
}
