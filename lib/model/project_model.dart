import 'employee_model.dart';

class Project {
  final String id;
  final String name;
  final Employee team;
  final double budget;

  Project({
    required this.id,
    required this.name,
    required this.team,
    required this.budget,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      team: (json['team']),
      budget: json['budget'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'team': team,
      'budget': budget,
    };
  }
}