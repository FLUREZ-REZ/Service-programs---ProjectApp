import '../../domain/entities/nav_item.dart';

class NavItemModel extends NavItem {
  const NavItemModel({
    required super.imagePath,
    required super.index,
  });

  factory NavItemModel.fromJson(Map<String, dynamic> json) {
    return NavItemModel(
      imagePath: json['imagePath'],
      index: json['index'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'index': index,
    };
  }
}
