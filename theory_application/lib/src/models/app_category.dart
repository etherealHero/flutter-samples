import 'package:isar/isar.dart';
import 'app_task.dart';

part 'app_category.g.dart';

@collection
class AppCategory {
  Id id = Isar.autoIncrement;
  String title;
  int color;

  @Backlink(to: "appCategory")
  final appTasks = IsarLinks<AppTask>();

  AppCategory({
    required this.title,
    required this.color,
  });
}
