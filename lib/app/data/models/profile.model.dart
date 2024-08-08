class Profile {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String dateBirth; 
  final String gender;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.dateBirth,
    required this.gender,
  });

  factory Profile.fromMap(Map<String, dynamic> map) => Profile(
        id: map['id'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        email: map['email'],
        phone: map['phone'],
        dateBirth: map['dateBirth'],
        gender: map['gender']
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'dateBirth': dateBirth,
        'gender': gender
      };
}

