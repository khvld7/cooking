import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/client/hive_names.dart';
import 'package:cooking/components/add_plan_custom.dart';
import 'package:cooking/components/advices_custom.dart';
import 'package:cooking/components/category_custom.dart';
import 'package:cooking/components/ingredients_custom.dart';
import 'package:cooking/components/instructions_custom.dart';
import 'package:cooking/components/settings_card.dart';
import 'package:cooking/components/tags_custom.dart';
import 'package:cooking/screens/views/add_plan_menu.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

var recipesBox = Hive.box<RecipesDB>(HiveBoxes.recipes);
var ingredientsBox = Hive.box<IngredientsDB>(HiveBoxes.recipes);
var menuBox = Hive.box<MenuDB>(HiveBoxes.menu);
var purchasesBox = Hive.box<PurchasesDB>(HiveBoxes.purchases);

List<CategoryCustom> recipesCategory = [
  CategoryCustom(
    id: 0,
    text: 'All',
  ),
  CategoryCustom(
    id: 1,
    image: 'assets/images/star.png',
    text: 'Избранное',
  ),
  CategoryCustom(
    id: 2,
    image: 'assets/images/category_images/drink.png',
    text: 'Напиток',
  ),
  CategoryCustom(
    id: 3,
    image: 'assets/images/category_images/soup.png',
    text: 'Суп',
  ),
  CategoryCustom(
    id: 4,
    image: 'assets/images/category_images/breakfast.png',
    text: 'Завтрак',
  ),
  CategoryCustom(
    id: 5,
    image: 'assets/images/category_images/lanch.png',
    text: 'Обед',
  ),
  CategoryCustom(
    id: 6,
    image: 'assets/images/category_images/snack.png',
    text: 'Закуска',
  ),
  CategoryCustom(
    id: 7,
    image: 'assets/images/category_images/dinner.png',
    text: 'Ужин',
  ),
  CategoryCustom(
    id: 8,
    image: 'assets/images/category_images/dessert.png',
    text: 'Десерт',
  ),
  CategoryCustom(
    id: 9,
    image: 'assets/images/category_images/salad.png',
    text: 'Салат',
  ),
];

List<AdvicesCustom> advices = [
  AdvicesCustom(
    image: 'assets/images/advices_images/tomato.png',
    text: 'Выбирайте свежие овощи с яркими цветами и упругими текстурами для более свежего вкуса и большего количества питательных веществ.',
    title: 'Овощи',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/meat.png',
    text: 'При выборе мяса обращайте внимание на свежесть, цвет и запах. Лучше всего покупать мясо у надежных поставщиков.',
    title: 'Мясо',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/condiment.png',
    text: 'Используйте свежие пряности и специи для усиления вкуса блюд. Храните их в сухом и прохладном месте, чтобы сохранить аромат.',
    title: 'Пряности и специи',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/oil.png',
    text: 'Предпочитайте холоднопрессованные масла и натуральный уксус для приготовления более полезных и вкусных блюд.',
    title: 'Масла и уксус',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/utensils.png',
    text:
        'Имейте под рукой разнообразную утварь, от сковородок разного размера до деревянных ложек и острых ножей для удобства и разнообразия приготовления блюд.',
    title: 'Утварь',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/plan.png',
    text: 'Планируйте блюда заранее, чтобы иметь возможность подготовить все необходимое заранее и избежать спешки во время готовки.',
    title: 'Планирование',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/experiment.png',
    text: 'Не бойтесь экспериментировать с рецептами и ингредиентами, чтобы найти свой уникальный вкус и стиль приготовления.',
    title: 'Эксперименты',
  ),
];

List<SettingsCard> settingsCard = [
  SettingsCard(
    image: 'assets/icons/confidential.svg',
    text: 'Политика конфиденциальности',
  ),
  SettingsCard(
    image: 'assets/icons/users_agrees.svg',
    text: 'Пользовательское соглашение',
  ),
  SettingsCard(
    image: 'assets/icons/active/mark_app_active.svg',
    text: 'Оценить приложение',
  ),
];

List<String> items = <String>['г.', 'мл.', 'шт.', 'ст.л.', 'ч.л.'];

List<IngredientsCustom> ingredients = [
  IngredientsCustom(
    controller: TextEditingController(),
  )
];
List<InstructionsCustom> step = [
  InstructionsCustom(
    controller: TextEditingController(),
  ),
];

List<AddPlanCustom> addPlan = [
  AddPlanCustom(
    controller: TextEditingController(),
  ),
];

List<TagsCustom> tags = [];
