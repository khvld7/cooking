import 'package:hive/hive.dart';
part 'hive_adapter.g.dart';

@HiveType(typeId: 0)
class RecipesDB extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  bool? category;
  @HiveField(2)
  String? about;
  @HiveField(3)
  String? tags;
  @HiveField(4)
  int? marks;
  @HiveField(5)
  bool? favourites;
  @HiveField(6)
  String? note;
  @HiveField(7)
  Map<int, dynamic>? ingredients = {};
  @HiveField(8)
  int? count;

  RecipesDB({
    this.name,
    this.about,
    this.tags,
    this.note,
    this.ingredients,
    this.category,
    this.favourites,
    this.marks,
    this.count = 0,
  });
}

@HiveType(typeId: 1)
class Instructions extends HiveObject {
  @HiveField(0)
  Map<int, String>? step = {};

  Instructions({this.step});
}
