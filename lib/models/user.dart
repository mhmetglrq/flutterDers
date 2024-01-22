// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String name;
  String surname;
  double weight;
  double height;
  UserModel({
    required this.name,
    required this.surname,
    required this.weight,
    required this.height,
  });

  UserModel copyWith({
    String? name,
    String? surname,
    double? weight,
    double? height,
  }) {
    return UserModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'weight': weight,
      'height': height,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      surname: map['surname'] as String,
      weight: map['weight'] as double,
      height: map['height'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, surname: $surname, weight: $weight, height: $height)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.surname == surname &&
      other.weight == weight &&
      other.height == height;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      surname.hashCode ^
      weight.hashCode ^
      height.hashCode;
  }
}
