class User {
  int id;
  String name;
  String surname;
  User({
    required this.id,
    required this.name,
    required this.surname,
  });

  User copyWith({
    int? id,
    String? name,
    String? surname,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'surname': surname,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      surname: map['surname'] as String,
    );
  }

  @override
  String toString() => 'User(id: $id, name: $name, surname: $surname)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.surname == surname;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ surname.hashCode;
}
