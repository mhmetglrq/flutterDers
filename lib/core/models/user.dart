// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String uid;
  String? name;
  String? surname;
  String email;

  UserModel({
    required this.uid,
    this.name,
    this.surname,
    required this.email,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? surname,
    String? email,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'surname': surname,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      surname: map['surname'] != null ? map['surname'] as String : null,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, surname: $surname, email: $email)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.surname == surname &&
        other.email == email;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ surname.hashCode ^ email.hashCode;
  }
}
