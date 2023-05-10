import 'package:equatable/equatable.dart';

import '../utils/utils.dart';

class User extends Equatable {
  final String id;
  final String name;

  const User({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: StringParser.parse(json['id']),
      name: StringParser.parse(json['name']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
