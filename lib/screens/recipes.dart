import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';

class Recipes extends StatelessWidget {
  const Recipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: recipesBox.length != 0
          ? ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column();
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/screens_isEmpty/recipes.png',
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Ваш список рецептов пуст',
                    style: TextStyle(
                        fontFamily: 'Source_Sans',
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(98, 132, 132, 1)),
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                borderRadius: BorderRadius.circular(6),
                onPressed: () => Navigator.pushNamed(context, '/add_recipes'),
                child: Text('Добавить рецепт'),
                textColor: Colors.white,
                color: greenColor,
                isActive: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
