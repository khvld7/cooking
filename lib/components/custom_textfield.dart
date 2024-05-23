import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatefulWidget {
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  TextCapitalization textCapitalization;
  String? prefixText;
  TextStyle? prefixStyle;
  int? maxLines;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction;
  String? initialValue;

  CustomTextfield({
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
    this.prefixIcon,
    super.key,
    this.inputFormatters,
    this.hintText,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.prefixText,
    this.prefixStyle,
    this.initialValue,
    required this.onChanged,
    this.onSubmitted,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: widget.initialValue,
          onFieldSubmitted: widget.onSubmitted,
          cursorHeight: 20,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          inputFormatters: widget.inputFormatters,
          cursorColor: Color.fromRGBO(103, 116, 130, 1),
          textAlignVertical: TextAlignVertical.center,
          minLines: null,
          maxLines: widget.maxLines,
          autocorrect: false,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            prefixText: widget.prefixText,
            prefixIcon: widget.prefixIcon,
            prefixStyle: TextStyle(
              color: Color.fromRGBO(98, 132, 132, 1),
              fontWeight: FontWeight.w400,
              fontSize: 13,
              fontFamily: 'Source_Sans',
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color.fromRGBO(98, 132, 132, 1),
              fontSize: 13,
              fontFamily: 'Source_Sans',
              fontWeight: FontWeight.w300,
            ),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'Source_Sans', color: Color.fromRGBO(64, 89, 89, 1), letterSpacing: 0.7),
        ),
      ],
    );
  }
}
