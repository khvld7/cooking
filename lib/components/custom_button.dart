import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final Color? color;
  final Color? textColor;
  final Border? border;
  BorderRadiusGeometry? borderRadius;
  bool isActive;

  CustomButton({
    super.key,
    required this.child,
    this.isActive = true,
    this.onPressed,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.alignment,
    this.color,
    this.textColor,
    this.borderRadius,
    this.border,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      decoration: BoxDecoration(
        color: widget.isActive ? widget.color : widget.color,
        border: widget.border,
        borderRadius: widget.borderRadius,
      ),
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      child: RawMaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: widget.isActive ? widget.onPressed : () {},
        child: widget.child,
        textStyle: TextStyle(
          color: widget.textColor,
          fontFamily: 'Source_Sans',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
