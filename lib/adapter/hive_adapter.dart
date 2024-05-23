import 'package:hive/hive.dart';
part 'hive_adapter.g.dart';

@HiveType(typeId: 0)
class IngredientsDB extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? count;
  @HiveField(3)
  String gramm;
  @HiveField(4)
  bool? isSelect;

  IngredientsDB({
    this.isSelect = false,
    this.id,
    this.name,
    this.count,
    this.gramm = 'г.',
  });
}

@HiveType(typeId: 1)
class InstructionsDB extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int id;

  InstructionsDB({this.id = 1, this.name = ''});
}

@HiveType(typeId: 2)
class RecipesDB extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String about;
  @HiveField(2)
  String tags;
  @HiveField(3)
  int mark;
  @HiveField(4)
  bool favourites;
  @HiveField(5)
  int person;
  @HiveField(6)
  List<IngredientsDB>? ingredients;
  @HiveField(7)
  String note;
  @HiveField(8)
  int category;
  @HiveField(9)
  List<InstructionsDB>? instructions;
  @HiveField(10)
  int id;
  @HiveField(11)
  bool isSelect;

  RecipesDB({
    this.id = 0,
    this.name = '',
    this.about = '',
    this.tags = '',
    this.mark = 0,
    this.person = 0,
    this.ingredients,
    this.note = '',
    this.category = 0,
    this.instructions,
    this.favourites = false,
    this.isSelect = false,
  });
}

@HiveType(typeId: 3)
class DayMenuDB extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? text;
  @HiveField(2)
  String? date;
  @HiveField(3)
  List<RecipesDB>? recipes;

  DayMenuDB({this.id, this.text, this.date, this.recipes});
}

@HiveType(typeId: 4)
class MenuDB extends HiveObject {
  @HiveField(0)
  List<DayMenuDB>? days;
  @HiveField(1)
  bool isWeek;

  MenuDB({
    this.days,
    this.isWeek = false,
  });
}

@HiveType(typeId: 5)
class PurchasesDB extends HiveObject {
  @HiveField(0)
  List<IngredientsDB>? ingredients;
  @HiveField(1)
  String? date;
  @HiveField(2)
  bool? isOpen;

  PurchasesDB({this.isOpen = false, this.ingredients, this.date});
}
