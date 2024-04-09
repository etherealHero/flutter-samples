import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart' as p;
import '../models/app_category.dart';
import '../models/app_task.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  // post data
  Future<void> saveAppCategory(AppCategory newAppCategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.appCategorys.putSync(newAppCategory));
  }

  Future<void> saveAppTask(AppTask newAppTask) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.appTasks.putSync(newAppTask));
  }

  Future<void> toggleTaskStatus(int taskId, bool newStatus) async {
    final isar = await db;

    AppTask? task = await isar.appTasks.where().idEqualTo(taskId).findFirst();

    isar.writeTxnSync<int>(
        () => isar.appTasks.putSync(task!..isDone = newStatus));
  }

  // get data
  Future<List<AppCategory>> getAllAppCategorys() async {
    final isar = await db;
    return await isar.appCategorys.where().findAll();
  }

  Future<List<AppTask>> getAllAppTasks() async {
    final isar = await db;
    return await isar.appTasks.where().findAll();
  }

  Future<List<AppTask>> getAppTasksFor(AppCategory category) async {
    final isar = await db;
    return await isar.appTasks
        .filter()
        .appCategory((q) => q.idEqualTo(category.id))
        .findAll();
  }

  // listeners
  Stream<List<AppCategory>> listenToAppCategorys() async* {
    final isar = await db;
    yield* isar.appCategorys.where().watch(fireImmediately: true);
  }

  Stream<List<AppTask>> listenToAppTasks() async* {
    final isar = await db;
    yield* isar.appTasks.where().watch(fireImmediately: true);
  }

  // DB General
  Future<Isar> openDB() async {
    final dir = await p.getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [AppCategorySchema, AppTaskSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
