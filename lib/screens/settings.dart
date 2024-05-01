import 'package:cooking/components/settings_card.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:cooking/globals.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 20),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return SettingsCard(
              image: settingsCard[index].image,
              text: settingsCard[index].text,
              onPressed: launchURL,
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Divider(
            height: 1,
            color: greenColor,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SettingsCard(
                image: settingsCard[2].image,
                text: settingsCard[2].text,
                onPressed: markApp,
              ),
            ),
          ],
        )
      ],
    );
  }
}
