import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountButton extends StatefulWidget {
  final Function()? onMinus;
  final Function()? onPlus;
  int? count;
  CountButton({this.count = 0, super.key, this.onMinus, this.onPlus});

  @override
  State<CountButton> createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(226, 243, 216, 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RawMaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            constraints: BoxConstraints.loose(Size.infinite),
            onPressed: widget.onMinus,
            child: SvgPicture.asset('assets/icons/minus.svg'),
          ),
          Text('${widget.count}',
              style: TextStyle(
                  color: Color.fromRGBO(64, 89, 89, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Source_Sans')),
          RawMaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            constraints: BoxConstraints.loose(Size.infinite),
            onPressed: widget.onPlus,
            child: SvgPicture.asset('assets/icons/plus.svg'),
          ),
        ],
      ),
    );
  }
}
