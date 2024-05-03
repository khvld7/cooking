import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/client/hive_names.dart';
import 'package:cooking/components/advices_custom.dart';
import 'package:cooking/components/category_custom.dart';
import 'package:cooking/components/settings_card.dart';
import 'package:cooking/components/tags_custom.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

var recipesBox = Hive.box<RecipesDB>(HiveBoxes.recipes);
var instructionsBox = Hive.box<Instructions>(HiveBoxes.instructions);

List<CategoryCustom> category = [
  CategoryCustom(
    image: 'assets/images/category_images/drink.png',
    text: 'Напиток',
  ),
  CategoryCustom(
    image: 'assets/images/category_images/soup.png',
    text: 'Суп',
  ),
  CategoryCustom(
    image: 'assets/images/category_images/breakfast.png',
    text: 'Завтрак',
  ),
  CategoryCustom(
    image: 'assets/images/category_images/lanch.png',
    text: 'Обед',
  ),
  CategoryCustom(
    image: 'assets/images/category_images/snack.png',
    text: 'Закуска',
  ),
  CategoryCustom(
    image: 'assets/images/category_images/dinner.png',
    text: 'Ужин',
  ),
  CategoryCustom(
    image: 'assets/images/category_images/dessert.png',
    text: 'Десерт',
  ),
  CategoryCustom(
    image: 'assets/images/category_images/salad.png',
    text: 'Салат',
  ),
];

List<AdvicesCustom> advices = [
  AdvicesCustom(
    image: 'assets/images/advices_images/tomato.png',
    text:
        'Выбирайте свежие овощи с яркими цветами и упругими текстурами для более свежего вкуса и большего количества питательных веществ.',
    title: 'Овощи',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/meat.png',
    text:
        'При выборе мяса обращайте внимание на свежесть, цвет и запах. Лучше всего покупать мясо у надежных поставщиков.',
    title: 'Мясо',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/condiment.png',
    text:
        'Используйте свежие пряности и специи для усиления вкуса блюд. Храните их в сухом и прохладном месте, чтобы сохранить аромат.',
    title: 'Пряности и специи',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/oil.png',
    text:
        'Предпочитайте холоднопрессованные масла и натуральный уксус для приготовления более полезных и вкусных блюд.',
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
    text:
        'Планируйте блюда заранее, чтобы иметь возможность подготовить все необходимое заранее и избежать спешки во время готовки.',
    title: 'Планирование',
  ),
  AdvicesCustom(
    image: 'assets/images/advices_images/experiment.png',
    text:
        'Не бойтесь экспериментировать с рецептами и ингредиентами, чтобы найти свой уникальный вкус и стиль приготовления.',
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
    image: 'assets/icons/mark_app.svg',
    text: 'Оценить приложение',
  ),
];

List<String> items = <String>['г.', 'мл.', 'шт.', 'ст.л.', 'ч.л.'];
List<Widget> ingredients = [];
List<Widget> addPlan = [];
List<TagsCustom> tags = [];
