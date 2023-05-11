import 'package:equatable/equatable.dart';
import 'package:movieapp/utils/utils.dart';

// ignore: must_be_immutable
class Genres extends Equatable {
  final String id;
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genres.fromJson(Map<String, dynamic> map) {
    return Genres(
      id: StringParser.parse(map['id'] ?? ''),
      name: StringParser.parse(map['name'] ?? ''),
    );
  }
}
