import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:flutter/material.dart';

class Purchases extends StatelessWidget {
  const Purchases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/screens_isEmpty/purchases.png',
              fit: BoxFit.contain,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Список покупок пуст. ',
                  style: TextStyle(
                      fontFamily: 'Source_Sans',
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(98, 132, 132, 1)),
                ),
                CustomButton(
                  child: Text(
                    'Пополнить сейчас',
                    style: TextStyle(
                      fontFamily: 'Source_Sans',
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: greenColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_purchases');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
