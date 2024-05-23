import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsCard extends StatefulWidget {
  final String image;
  final String text;
  final Function()? onPressed;

  const SettingsCard({
    super.key,
    required this.image,
    required this.text,
    this.onPressed,
  });

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            blurRadius: 5,
            color: Color.fromARGB(255, 230, 230, 230),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: CustomButton(
          textColor: Colors.black,
          width: 24,
          height: 24,
          isActive: true,
          onPressed: widget.onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset(
                  '${widget.image}',
                  colorFilter: ColorFilter.mode(greenColor, BlendMode.srcIn),
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Text('${widget.text}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
