import 'package:cooking/components/style.dart';
import 'package:flutter/material.dart';

class AdvicesCustom extends StatefulWidget {
  final String image;
  final String title;
  final String text;

  const AdvicesCustom({
    super.key,
    required this.image,
    required this.text,
    required this.title,
  });

  @override
  State<AdvicesCustom> createState() => _AdvicesCustomState();
}

class _AdvicesCustomState extends State<AdvicesCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            blurRadius: 5,
            color: Color.fromARGB(255, 230, 230, 230),
          ),
        ],
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Image.asset(
              widget.image,
              width: 48,
              height: 48,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.title}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Source_Sans',
                      color: Color.fromRGBO(14, 19, 19, 1),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Flexible(
                    child: Text(
                      '${widget.text}',
                      style: textStyleAdvices,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
