import 'package:isar/isar.dart';
import 'app_category.dart';

part 'app_task.g.dart';

@collection
class AppTask {
  Id id = Isar.autoIncrement;
  String title;
  String description;
  bool isDone;
  final appCategory = IsarLink<AppCategory>();

  AppTask({
    required this.title,
    required this.description,
  }) : isDone = false;
}
