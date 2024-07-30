import 'dart:convert';
import '../model/project_model.dart';
import 'package:http/http.dart' as http;

class ProjectRepository {
  final String apiUrl;
  final String accessToken;

  ProjectRepository({required this.apiUrl, required this.accessToken});

  Future<void> createProject(Project project) async {
    final response = await http.post(
      Uri.parse('$apiUrl/projects'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(project.toJson()..remove('id')),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create project');
    }
  }

  Future<Project> getProject(String id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/projects/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },        
    );

    if (response.statusCode == 200) {
      return Project.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load project');
    }
  }

  Future<List<Project>> getProjects() async {
    final response = await http.get(
      Uri.parse('$apiUrl/projects'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> projects = jsonDecode(response.body);
      return projects.map((project) => Project.fromJson(project)).toList();
    } else {
      throw Exception('Failed to load projects');
    }

  }
  
  Future<void> updateProject(Project project) async {
    final response = await http.put(
      Uri.parse('$apiUrl/projects/${project.id}'),
      headers: <String, String>{        
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(project.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update project');
    }
  }

  Future<void> deleteProject(String id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/projects/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete project');
    }
  }

}