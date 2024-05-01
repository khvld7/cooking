import 'package:cooking/components/advices_custom.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';

class Advices extends StatelessWidget {
  const Advices({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 20, bottom: 20),
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return AdvicesCustom(
          image: advices[index].image,
          text: advices[index].text,
          title: advices[index].title,
        );
      },
    );
  }
}
