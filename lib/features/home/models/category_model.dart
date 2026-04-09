import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String? icon;
  final String? description;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    this.icon,
    this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      icon: json["icon"],
      description: json["description"],
    );
  }

  @override
  List<Object?> get props => [id, name, slug, icon, description];
}
